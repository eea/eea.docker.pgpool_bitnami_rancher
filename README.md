# eea.docker.pgpool_bitnami_rancher

Derivative of https://github.com/bitnami/bitnami-docker-pgpool

To be used in rancher 1.6.x orchestrator, as there's not support of "healthcheck" directive with docker-compose 2.0
(https://github.com/bitnami/bitnami-docker-pgpool/blob/master/docker-compose.yml#L51-L55)

Supervisor is used to workaround.
