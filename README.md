# Project Zomboid Dedicated Server for Docker

1. Ensure to change the "changeme" values in the Dockerfile.
2. `-Xms` and `-Xmx` flags can be added to `entry.sh` to manage memory. Check other [Project Zomboid startup parameters](https://pzwiki.net/wiki/Startup_parameters)
3. `git clone https://github.com/tomasdev/pzsv`
4. `cd pzsv`
5. `docker build -t pzsv .`
6. `docker run -d -p $HOST_IP:16261:16261/udp -ti pzsv`

To change the ini file (pending work)
1. `docker ps -a` to list all containers, to find the CONTAINER_ID
2. `docker exec -it $CONTAINER_ID bash`
3. 
