
-- The code below uses the Corona SDK to get data from a remote server using JSON
-- This code originaly appeard on the Omnigeek website where Rob Miracle provides
-- an excellent tutorial on how to use the Corona SDK with REST api services.
-- This is a complete working copy of the code from that tutorial, which can be
-- found here, http://omnigeek.robmiracle.com/2012/04/15/using-corona-sdk-with-rest-api-services

-- To get the code to work, you will need to set up the database and php web application
-- on the remote server. Then you will need to replace the values for the userid,
-- password, and URL below.

-- Provided the database and web application are set up properly, everything should work
-- and you should see printed messages in your terminal or log files, depending on 
-- where Corona is writing your testing messages to.

local mime = require("mime")
local json = require("json")

local userid = "username-goes-here"
local password = "password-goes-here"

local URL = "http://your-server-name-here.com/json.php?userid=" 
.. mime.b64(userid) .. "&password=" .. mime.b64(password)

-- DEBUG: Show constructed url
-- print ( "Remote URL: " .. URL )

local function loginCallback(event)
    
    -- perform basic error handling
    if ( event.isError ) then
        print( "Network error!")
    else
        -- return a response code
        print ( "RESPONSE: " .. event.response )
        local data = json.decode(event.response)
        
        -- display a result to the user
        if data.result == 200 then
            -- player logged in okay, display welcome message
            print("Welcome back",data.firstname:gsub("^%l", string.upper))
        else
            -- bad password, or player not found. Prompt user to login again
            print("Please try again")
        end
    end
    
    return true
end

-- make JSON call to the remote server
network.request( URL, "GET", loginCallback ) 

