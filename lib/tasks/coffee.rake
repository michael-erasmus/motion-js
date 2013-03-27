# desc "build client api and copy to resources"
# task :build_js_client_api => [api_dir, lib_dir] do
#   Rake::Task['compile_cs'].invoke('../client_api')

#   sh %{ cp  ../client_api/js/* resources/js/api }
#   sh %{ cp  ./../client_api/lib/* resources/js/lib }
# end
desc "foo"
task :foo do
  p File.join(File.dirname(__FILE__))
end