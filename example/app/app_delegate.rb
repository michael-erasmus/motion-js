class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @controller = JSController.new

    @controller.load_html_file do
      puts "html loaded, adding js_handler"
      @controller.js_handler_for("nativeAlert") do |message|
        alert = UIAlertView.alloc.initWithTitle("this is a javascript alert", message: message, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles:nil)
        alert.show
      end
    end
    true
  end
end
