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

  def webViewDidFinishLoad(webView)
    @finished_loading.call if @finished_loading
    @finished_loading = nil
  end

  private
  def web_view
    @web_view ||= UIWebView.alloc.init.tap do |w|
      w.delegate = self
    end
  end

end