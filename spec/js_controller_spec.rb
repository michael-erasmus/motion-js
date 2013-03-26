describe "JSController" do
  before do
    @controller = JSController.alloc.init
  end

  it "can execute JS" do
    @controller.execute("1 + 1").should == "2"
  end

  it "can define functions and then execute them" do
    @controller.execute("function foo(){return 'bar';}")
    @controller.execute("foo()").should == 'bar'
  end

end
