# Spring boot web Getting Started Guide on Docker

To make the app run, run these commands :  
`make build t="<your tag>:<your version>"`  
or  
`docker build -t <your tag>:<your version> .`  

`make run t="<your tag>:<your version>"`
or
`docker run --rm -p 8080:8080 t="<your tag>:<your version>"`