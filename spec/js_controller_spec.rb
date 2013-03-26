describe "JSController" do
  before do
    @controller = JSController.alloc.init
  end

  describe "#execute" do
    it "can execute JS" do
      @controller.execute("1 + 1").should == "2"
    end

    it "can define functions and then execute them" do
      @controller.execute("function foo(){return 'bar';}")
      @controller.execute("foo()").should == 'bar'
    end
  end

  describe "#load_html_file" do
    it "loads index.html file from the main bundle by default, and calls back when done" do
      loaded = false
      @controller.load_html_file do
        loaded = true
        @controller.execute("definedInIndex()").should == "present!"
      end
      RunLoopHelpers.proper_wait 1
      loaded.should == true
    end

    it "complains when trying to load a file that's not there" do
      -> { @controller.load_html_file("nothere")}.should.raise IOError
    end
  end

end
