## Architecture

## API Definiton
- Login endpoint
```http request
POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/login
```
> curl -X POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/login -u \<email\>:\<password\>

- Upload endpoint
```http request
POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/upload
```
> curl -X POST -F 'file=@./video.mp4' -H 'Authorization: Bearer \<JWT Token\>' http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/upload

- Download endpoint
```http request
GET http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/download?fid=<Generated file identified>
```
> curl --output video.mp3 -X GET -H 'Authorization: Bearer \<JWT Token\>' "http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/download?fid= \<Generated fid\>"
