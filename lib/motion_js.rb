unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

import File.join(File.dirname(__FILE__), "tasks/motion_js.rake")

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion_js/*.rb')).each do |file|
    app.files.unshift(file)
  end
end

