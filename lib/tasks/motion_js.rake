namespace :js do
  desc "Initializes a js project"
  task :init => ['resources/js'] do
    sh "cp -i #{File.join(File.dirname(__FILE__), 'template/index.html')} resources/"
    sh "cp -i #{File.join(File.dirname(__FILE__), 'template/nativeBridge.js')} resources/js/"
  end

  directory 'resources/js'
end