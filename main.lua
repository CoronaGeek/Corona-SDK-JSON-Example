
-- This app code originally appeared on the Omnigeek website where Rob Miracle 
-- provides an excellent tutorial on how to use the Corona SDK with REST api services.
-- http://omnigeek.robmiracle.com/2012/04/15/using-corona-sdk-with-rest-api-services
-- I have made a few addition comments and modifications to the original code, but for the 
-- most part everything is true to the original tutorial.
-- See the readme.txt file for more details.

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
        if event.status == 200 then
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

