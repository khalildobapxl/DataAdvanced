# How to run
1. Run ```docker-compose up --build``` and wait for the container to be created and started
### SQL
2. Install `Oracle SQL Developer Extension for VS Code` extension
3. Go to the extension and start a new connection
4. Give the connection a name
5. set Username to student or SYS and password to pxl (click save password)
6. `Hostname:localhost` `Port:1521` `Service-Name:xe`
7. Clicking test should give a success message, click connect and that's it you are ready to run sql scritps.

### MongoDB
2. You just have to execute `docker exec -it mongodb mongosh -u student -p pxl --authenticationDatabase admin` and now you are in the container