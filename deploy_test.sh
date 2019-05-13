docker build -t vivekthite/multi-client:latest -t vivekthite/multi-client:$SHA -f ./client/Dockerfile ./client/
docker build -t vivekthite/multi-server:latest -t vivekthite/multi-server:$SHA -f ./server/Dockerfile ./server/
docker build -t vivekthite/multi-worker:latest -t vivekthite/multi-worker:$SHA -f ./worker/Dockerfile ./worker/
docker push vivekthite/multi-client:latest
docker push vivekthite/multi-server:latest
docker push vivekthite/multi-worker:latest

docker push vivekthite/multi-client:$SHA
docker push vivekthite/multi-server:$SHA
docker push vivekthite/multi-worker:$SHA

