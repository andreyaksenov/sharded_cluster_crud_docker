# Sharded cluster with CRUD: Docker

## Running

1. Run Docker.

2. Copy the Enterprise SDK and TCM archives (`tarantool-enterprise-sdk-<version>.tar.gz`, `tcm-<version>.tar.gz`) to the `sdk` folder next to `Dockerfile`.

3. Update archive names in `Dockerfile`.

4. (Optional) If you use macOS aarch64, set the platform:

   ```shell
   $ export DOCKER_DEFAULT_PLATFORM=linux/amd64
   ```

5. Build the image:

   ```shell
   $ docker build -t my-application .
   ```

6. Execute `docker compose up`:

   ```shell
   $ docker compose up
   ```
   
   Wait until the cluster is run:

   ```shell
   tarantool-1  |    • Application was successfully built
   tarantool-1  |    • Starting an instance [sharded_cluster_tcm:storage-a-001]...
   tarantool-1  |    • Starting an instance [sharded_cluster_tcm:storage-a-002]...
   tarantool-1  |    • Starting an instance [sharded_cluster_tcm:storage-a-003]...
   ...
   ```

## TCM

1. Open http://0.0.0.0:8080/.

2. Log in using generated credentials, for example:

   ```shell
   WRN Generated super admin credentials login=admin password=tF1FAurUm5mQhsrmaeHNDUIb0LKvZQAv
   ...
   
3. Click the `Actions` button on the `Stateboard` page and choose `Bootstrap vshard`.

4. To insert sample data, open the router's console and call `crud.insert_many()`:

   ```lua
   crud.insert_many('bands', {
       { 1, box.NULL, 'Roxette', 1986 },
       { 2, box.NULL, 'Scorpions', 1965 },
       { 3, box.NULL, 'Ace of Base', 1987 },
       { 4, box.NULL, 'The Beatles', 1960 },
       { 5, box.NULL, 'Pink Floyd', 1965 },
       { 6, box.NULL, 'The Rolling Stones', 1962 },
       { 7, box.NULL, 'The Doors', 1965 },
       { 8, box.NULL, 'Nirvana', 1987 },
       { 9, box.NULL, 'Led Zeppelin', 1968 },
       { 10, box.NULL, 'Queen', 1970 }
   })
   ```
