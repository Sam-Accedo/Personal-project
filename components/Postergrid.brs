function init() as void
    m.top.setFocus(true)
    m.postergrid = m.top.findNode("PosterGrid")
    
    m.readPosterGridTask = createObject("roSGNode", "ContentReader")
    m.readPosterGridTask.contenturi = "http://c4.arm.accedo.tv/develop/matt/we/feed.json"
    m.readPosterGridTask.observeField("content", "showpostergrid")
    m.readPosterGridTask.control = "RUN"
end function

function showpostergrid() as void
    m.postergrid.content = m.readPosterGridTask.content
    m.postergrid.setFocus(true)
end function


function onKeyEvent(key as string, press as boolean) as boolean
    if press then
      video = m.top.findNode("Video")

      if key = "OK" and m.postergrid.hasFocus() then
        index=  m.postergrid.itemFocused
        data = m.postergrid.content.getChild(index)
        video.content = data
        video.visible = "true"
        video.setFocus(true)
        video.control = "play"

      else if key = "back" then 
        video.visible = "false"
        m.readPosterGridTask.control = "RUN"
        return true
        
      else if key = "up" and m.postergrid.hasFocus() then
        m.PinButton = m.top.findNode("PinButton")
        m.PinButton.setFocus(true)

      else if key = "OK" and m.PinButton.hasFocus() then 
        m.PinPad = m.top.findNode("PinPad")
        m.PinPad.visible = "true"
        m.PinPad.setFocus(true)

      else if m.PinPad.Pin = "1234"  then 
        m.PinPad = m.top.findNode("PinPad")
        m.error = m.top.findNode("error")
        m.error.visible = "false"
        m.PinPad.visible = "false"

        m.postergrid.setFocus(true)

      else if m.PinPad.Pin <> "1234"  then 
        m.error = m.top.findNode("error")
        m.error.visible = "true"
      
      else if key = "back" and m.PinPad.hasFocus() then        
        m.PinPad = m.top.findNode("PinPad")
        m.PinPad.visible = "false"
        m.postergrid.setFocus(true)
        end if 


      end if
  end function    
    
