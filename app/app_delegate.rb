class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    #for debugging
    @controller = JSController.new
    @controller.load_html_file do
      p 'file loaded'
    end
    true
  end
end
