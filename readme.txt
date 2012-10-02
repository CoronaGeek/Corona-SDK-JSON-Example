10/1/2012 - Working Corona SDK JSON example app code

The code in main.lua uses the Corona SDK to get data from a remote server using JSON

This app code originally appeared on the Omnigeek website where Rob Miracle provides an excellent tutorial on how to use the Corona SDK with REST api services.

Rob's tutorial does not provide finished working app code, so this main.lua file is what I put together while following Rob's instructions.
This is a complete working copy of the code from that tutorial, which can be found here, http://omnigeek.robmiracle.com/2012/04/15/using-corona-sdk-with-rest-api-services
I have made a few addition comments and modifications to the original code, but for the most part everything is true to the original tutorial.

To see the Corona app code in action, you will need to set up the database and php web application on the remote server according to Rob's instructions in his tutorial. 
You will need to replace the placeholder values for the userid, password, and URL in the Lua code.
Provided the database and web application are set up properly, everything should work and you should see printed messages in your terminal or log files, depending on where Corona is writing your testing messages to.

If you want to skip all that and just use the Lua code in your project, then that's cool to :P

I'd like to thank Rob Miracle and all the helpful people on the Corona Labs forums. As a newbie myself to Lua and the Corona SDK, your generous time and talents are greatly appreciated.

Charles McKeever
http://CoronaGeek.com