## First run (Remember to save your default wallet master password)
# master password: ..PW5...
 cleos wallet create
 cp contracts/hello/ . -R
 eosiocppfix -o hello/hello.wast hello/hello.cpp
## You can generate or import new keys
# cleos create key
# Private key: 5J21F3YcGvnACPUsAgd7qgnddFQaJtiEPYEMFWerzxrDkwsVRQc
# Public key: EOS8Dx6iX3L6q6Nzs6pqVaqbskhYH3APEo55eVw1S6N1ZF5T87Eqo 
# cleos wallet keys
 cleos wallet import 5J21F3YcGvnACPUsAgd7qgnddFQaJtiEPYEMFWerzxrDkwsVRQc
 cleos create account eosio mycontract EOS8Dx6iX3L6q6Nzs6pqVaqbskhYH3APEo55eVw1S6N1ZF5T87Eqo EOS8Dx6iX3L6q6Nzs6pqVaqbskhYH3APEo55eVw1S6N1ZF5T87Eqo
 cleos set contract mycontract hello/ -p mycontract
 cleos push action mycontract hi '["luigi"]' -p mycontract

## Second run
cleos wallet unlock --password PW5KiicvVXaJFAsQM3bf9NAQCMdUmb2mgmbD3ckPrH4Eviw6HAAbb
cleos wallet import 5KVZF2vxY4ENugwDw2tCdYLmG7LzSyAc2KEk3x8HFeXtVFP1Xnk

# cleos create key
# Private key: 5KVZF2vxY4ENugwDw2tCdYLmG7LzSyAc2KEk3x8HFeXtVFP1Xnk
# Public key: EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm
# cleos wallet keys
 
cleos create account eosio luigi EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm
cleos create account luigi luigi.token EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm
# cleos get accounts EOS7ftQ12qreTrSN5BEP7WAJ5RZQg45pu4byhNcpioMEVr6CrnoPm
cp contracts/eosio.token/ . -R
eosiocppfix -o eosio.token/eosio.token.wast eosio.token/eosio.token.cpp

cleos set contract luigi.token eosio.token -p luigi.token
cleos push action luigi.token create '[ "luigi", "100.0000 GGG", 0, 0, 0]' -p luigi.token
cleos push action luigi.token issue '[ "luigi", "99.0000 GGG", "memo" ]' -p luigi
cleos get currency balance luigi.token luigi
cleos push action luigi.token transfer '[ "luigi", "eosio", "15.0000 GGG", "m" ]' -p luigi