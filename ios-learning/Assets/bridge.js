setTimeout(function() {
  var rows = [].slice.call(document.querySelectorAll('[data-template-name="tentrance"] .horizontal-view'))

  rows.forEach(function(r) {
    var cols = [].slice.call(r.querySelectorAll('.vertical-view'))

    cols.forEach(function(c) {
      var img = c.firstChild.firstChild
      var title = c.lastChild.innerText

      img.style.backgroundImage = 'url(http://tp3.sinaimg.cn/1649383490/180/5706347282/1)'
      img.style.borderRadius = '45px'

      window.webkit && webkit.messageHandlers.callbackHandler.postMessage(title + ' has been attacked!')
    })
  })
}, 1000)
