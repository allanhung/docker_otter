# docker compose for otter

## How to use

Build all docker images with:

``` shell
git clone https://github.com/allanhung/docker_otter.git
cd docker_otter
docker-compose build
```

## How to run


``` shell
docker-compose up -d
```
1. Go to manager web page to set the zookeeper information.
2. Go to manager web page to set the node information (with docker node ip address).
3. docker-compose exec node /opt/otter/otter_node/bin/stop.sh
4. docker-compose exec node /opt/otter/otter_node/bin/start.sh
5. recheck the node status on manager web

## Reference
  * https://github.com/alibaba/otter
  * https://github.com/mr5/docker_otter_manager
  * https://github.com/mr5/docker_otter_node
