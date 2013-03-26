class JSController < UIViewController
  def execute(js_string)
    web_view.stringByEvaluatingJavaScriptFromString(js_string)
  end

  private
  def web_view
    @web_view ||= UIWebView.alloc.init.tap{|w| w.delegate = self}
  end

end