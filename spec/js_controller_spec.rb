describe "JSController" do
  before do
    @controller = JSController.alloc.init
  end

  it "can execute JS" do
    @controller.execute("1 + 1").should == "2"
  end
end
