function init() as void
    m.top.setFocus(true)
    m.postergrid = m.top.findNode("PosterGrid")
    
    m.readPosterGridTask = createObject("roSGNode", "ContentReader")
    m.readPosterGridTask.contenturi = "http://www.sdktestinglab.com/Tutorial/content/rendergridps.xml"
    m.readPosterGridTask.observeField("content", "showpostergrid")
    m.readPosterGridTask.control = "RUN"
end function

function showpostergrid() as void
    m.postergrid.content = m.readPosterGridTask.content
end function
