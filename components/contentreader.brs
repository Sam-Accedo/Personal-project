function init() as void
    m.top.functionName = "getcontent"
end function 

function getcontent() as void
    content = createObject("roSGNode", "ContentNode")
    print content

    readInternet = createObject("roUrlTransfer")
    readInternet.setUrl(m.top.contenturi)
    Videos = ParseJson(readInternet.GetToString())
    print 
    
    i = 0
    while i < 3:
        entry = Videos[i]
        formattedEntry = createObject("roSGNode", "ContentNode")
        
        formattedEntry.setFields(entry)

        formattedEntry.HDPOSTERURL = entry.image.href
        formattedEntry.SHORTDESCRIPTIONLINE1 = entry.title
        formattedEntry.SHORTDESCRIPTIONLINE2 = entry.summary

        content.appendChild(formattedEntry)

        ' age_rating = entry.ageRating
        ' file_type = entry.type
        ' stream = entry.stream.href
        ' expires = entry.expires
        i = i+1
    end while
    m.top.content = content


end function
