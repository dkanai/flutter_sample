## command
- See Makefile

## structure
- screen
  - each screen root widget
- widget
  - each screen child widget
- repository
  - data source layer ex) json api
- model
  - object mapping from repository
  - it should sepalate responsibility more if need it
- test
  - widget test and unit test
- test_driver
  - e2e test
 
## widget test
- it usually mock data source layer
  - there is simple DI class for mock. it can change to better solution
  - there is simple DataFactory class for setup data source. it can change to better solution
- it really help test for UI event and refactoring widget structure with good speed

## e2e test
- there is Driver which is wrapper of raw Driver

## web build
- flutter app can build to web app(just javascript files)
- this is easy to deploy if there is no deploy env to Native app yet.
  - ex) just put to S3, Surge
