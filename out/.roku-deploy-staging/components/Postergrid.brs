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
      if key = "OK" then
        print m.postergrid.itemFocused
        return true 

      end if  
    end if
  end function    
    
