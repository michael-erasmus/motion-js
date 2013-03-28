motion-js
=========

Javascript/CoffeeScript bridge for RubyMotion apps


Usage
=========

Include the lib file (I still haven't gemified it)

Call the rake task to initialize your javascript bridge:

`rake js:init`

Open resources/index.html and include any js you want.

Instantiate a JSController somewhere and load your html file.
```ruby

@controller = JSController.new
@controller.load_html_file do
  ...
end
```
Now you can call javascript:

```ruby

@controller.execute('1+1')
@controller.execute_async('foo()') do |result|
 #do stuff with your result here 
end

```
Stuff I need to do
---------
Add better error handling, make it generally more robust.
The JSController is just a day or two old and already needs some serious refactoring.

Stuff I still want to do 
-----------
Make a better DSL for it.
Add more rake tasks, incorporate CoffeeScript compilation and testing.

Careful
-----------
You probably shouldn't be using this in production yet. If you do, please send pull requests (believe me, there will be some)

Props
-----------
Thanks to @hendrikswan for the inspiration and a whole lot of code and lessons learned.

License
---------
MIT License


