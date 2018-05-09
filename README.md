# EOS-playground

The easiest way to start develop smart contracts in the EOS Blockchain with Docker

### Set up

```
git clone https://github.com/grigio/eos-playground.git

# latest official docker images images
docker pull eosio/eos && \
docker pull eosio/builder && \
docker pull mongo

# persistance
docker volume create mongo-data-volume && \
docker volume create nodeos-data-volume && \
docker volume create keosd-data-volume

# latest example EOS smart contracts
svn export https://github.com/eosio/eos.git/trunk/contracts playground/contracts

```

You can customize which commands to run at startup in the EOS playground environment

```
cp bashrc.example bashrc
```

### Let's enter in the EOS Development Environment!

When you need, you can run the commands below in 2 terminal windows. The execution order is important.

```
# terminal 1 - Blockchain logs
docker-compose up

# terminal 2 - Interactive EOS environment, eosiocpp, cleos, ..
docker-compose exec -u $( id -u $USER ) builder bash --rcfile /bashrc
```

To test that all the pieces are fine together you can run:

```
playground❯ cleos get info
{
  "server_version": "2ae61517",
  "head_block_num": 361,
  "last_irreversible_block_num": 360,
  "head_block_id": "000001697eeb23ecab64cf78365c3ef5c959c543bf4d495c5b79c2ec5456480a",
  "head_block_time": "2018-05-09T06:54:30",
  "head_block_producer": "eosio"
}
```

You should see the block num increasing.

## Clean up

```
# Reset the persistant data
docker-compose down
docker volume rm  mongo-data-volume && \
docker volume rm  nodeos-data-volume && \
docker volume rm keosd-data-volume

rm -rfv playground/contracts
```