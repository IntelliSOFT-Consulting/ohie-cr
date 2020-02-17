# ohie-cr
OpenEMPI Master Patient Index

To build the Docker image locally, run:

```bash
docker build -t uwitech/ohie-cr .
```

To run OpenEMPI standalone, use the docker-compose.yml in the compose directory by running:

```bash
docker-compose up
```

OpenEMPI will be available at port 8088 with credentials admin/admin.
PostgreSQL will be available and running at port 5433
