class JSController < UIViewController
  def execute(js_string)
    web_view.stringByEvaluatingJavaScriptFromString(js_string)
  end

  def load_html_file(name='index', &block)
    path  = NSBundle.mainBundle.pathForResource(name, ofType:'html')
    raise IOError unless NSFileManager.defaultManager.fileExistsAtPath(path)
    file_url = NSURL.fileURLWithPath(path)
    request = NSURLRequest.requestWithURL(file_url)

    @finished_loading = block
    web_view.loadRequest(request)
  end

  def js_handler_for(id, &block)
    callbacks[id] = block
  end

  def webViewDidFinishLoad(webView)
    @finished_loading.call if @finished_loading
    @finished_loading = nil
  end

  def execute_async(js_string, &block)
    id = create_uuid
    js_handler_for(id, &block)
    execute async_js(js_string, id)
  end

  def webView(view, shouldStartLoadWithRequest:request, navigationType:type)
    request_string = request.URL.absoluteString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)

    if(request_string.hasPrefix("js-bridge-frame"))
      components = request_string.split('::')
      callback_id, return_val = components[1], components[2]

      callbacks[callback_id].call return_val if @callbacks[callback_id]
      return false
    end
    true
  end

  private
  def web_view
    @web_view ||= UIWebView.alloc.init.tap do |w|
      w.delegate = self
    end
  end

  def async_js(js_string, id)
    js = <<-oes
      var callBackId = '#{id}';
      var result = #{js_string};

      nativeBridge.call(callBackId, result);
    oes
  end

  def create_uuid
    uuid = CFUUIDCreate(nil)
    uuid_string = CFUUIDCreateString(nil, uuid)
    CFRelease(uuid)
    uuid_string
  end

  def callbacks
    @callbacks ||= {}
  end

end