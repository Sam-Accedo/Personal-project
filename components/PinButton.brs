' Custom button code

' Runs the classes from the xml file    
function init()  
    m.background = m.top.findNode("background_3")
    m.text = m.top.findNode("text")
  end function


function onTextChange()
    m.text.text = m.top.text
end function

' Sets width of the button 
function onWidthChange(message)
    width = message.getData()
    m.background.width = width
    m.text.width = width
end function

' Sets the height of the button 
function onHeightChange()
    height = m.top.height
    m.background.height = height
    m.text.height = height
end function
 