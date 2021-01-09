# DockerMetricbeat

When using in a `docker-compose.yml` file, use the following settings:

```
environment:
  - ADMIN_USER=<Elastic superuser name>
  - ADMIN_PASSWORD=<Elastic superuser password>
volumes:
  - /var/run/docker.sock:/var/run/docker.sock
```

Also make sure metricbeat is connected to the [logstash, elasticsearch, kibana] network and the heartbeat network with the alias `metricbeat`.
