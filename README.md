# backingboarddesign

link to access via mybinder:
https://mybinder.org/v2/gh/HJK0309/backingboarddesign/HEAD?urlpath=%2Fdoc%2Ftree%2Fbackingboarddesign.ipynb

## Build image

To run and override any existing container with the same name, use:

```sh
docker rm -f backingboard-app
docker build -t backingboard-app .
```

Start a container and run the app in the container:
```sh
docker run --rm --publish 8866:8866 --name backingboard-app backingboard-app 
```

For debugging the container:
```sh
docker run -it --rm --publish 8866:8866 backingboard-app /bin/ash
```

Access the app via:
```sh
-> http://localhost:8866/
```
