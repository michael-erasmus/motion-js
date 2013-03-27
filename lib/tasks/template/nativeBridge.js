var NativeBridge;

NativeBridge = (function() {
  var createFrame;

  function NativeBridge() {}

  createFrame = function(id, args) {
    var iframe, src;

    iframe = document.createElement("IFRAME");
    src = "js-bridge-frame::" + id + "::" + args;
    iframe.setAttribute("src", src);
    return iframe;
  };

  NativeBridge.prototype.call = function(callBackId, args) {
    var iframe;

    iframe = createFrame(callBackId, args);
    document.documentElement.appendChild(iframe);
    iframe.parentNode.removeChild(iframe);
    return iframe = null;
  };

  return NativeBridge;

})();

var nativeBridge = new NativeBridge();