# KMITL_Auto
No GUI auto authentication to access internet in KMITL 

PhantomJS Project.

Docker build and run.
----------------------

Build.
````
docker build -t kmitl-bot .
````

Run.
````
docker run -d kmitl-bot
````

Run this command to start service.
----------------------------------
```
phantomjs --ignore-ssl-errors=true main.js 
```
