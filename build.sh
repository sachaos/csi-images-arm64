APP_NAME=csi-attacher
DIR_NAME=external-attacher
TAG=v3.0.0

(
    echo "Building $APP_NAME on $DIR_NAME"
    cd $DIR_NAME
    git fetch --tags
    git checkout $TAG
    GOOS=linux GOARCH=arm64 go build ./cmd/$APP_NAME
    mv $APP_NAME ../bin
)

docker build --build-arg binary=$APP_NAME ./bin -f Dockerfile -t ghcr.io/sachaos/$APP_NAME:$TAG
docker push ghcr.io/sachaos/$APP_NAME:$TAG

APP_NAME=csi-provisioner
DIR_NAME=external-provisioner
TAG=v1.6.0

(
    echo "Building $APP_NAME on $DIR_NAME"
    cd $DIR_NAME
    git fetch --tags
    git checkout $TAG
    GOOS=linux GOARCH=arm64 go build ./cmd/$APP_NAME
    mv $APP_NAME ../bin
)

docker build --build-arg binary=$APP_NAME ./bin -f Dockerfile -t ghcr.io/sachaos/$APP_NAME:$TAG
docker push ghcr.io/sachaos/$APP_NAME:$TAG

APP_NAME=csi-resizer
DIR_NAME=external-resizer
TAG=v0.5.0

(
    echo "Building $APP_NAME on $DIR_NAME"
    cd $DIR_NAME
    git fetch --tags
    git checkout $TAG
    GOOS=linux GOARCH=arm64 go build ./cmd/$APP_NAME
    mv $APP_NAME ../bin
)

docker build --build-arg binary=$APP_NAME ./bin -f Dockerfile -t ghcr.io/sachaos/$APP_NAME:$TAG
docker push ghcr.io/sachaos/$APP_NAME:$TAG

APP_NAME=csi-snapshotter
DIR_NAME=external-snapshotter
TAG=v2.1.1

(
    echo "Building $APP_NAME on $DIR_NAME"
    cd $DIR_NAME
    git fetch --tags
    git checkout $TAG
    GOOS=linux GOARCH=arm64 go build ./cmd/$APP_NAME
    mv $APP_NAME ../bin
)

docker build --build-arg binary=$APP_NAME ./bin -f Dockerfile -t ghcr.io/sachaos/$APP_NAME:$TAG
docker push ghcr.io/sachaos/$APP_NAME:$TAG

APP_NAME=csi-node-driver-registrar
DIR_NAME=node-driver-registrar
TAG=v2.0.1

(
    echo "Building $APP_NAME on $DIR_NAME"
    cd $DIR_NAME
    git fetch --tags
    git checkout $TAG
    GOOS=linux GOARCH=arm64 go build ./cmd/$APP_NAME
    mv $APP_NAME ../bin
)

docker build --build-arg binary=$APP_NAME ./bin -f Dockerfile -t ghcr.io/sachaos/$APP_NAME:$TAG
docker push ghcr.io/sachaos/$APP_NAME:$TAG
