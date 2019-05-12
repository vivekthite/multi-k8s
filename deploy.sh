docker build -t vivekthite/multi-client:latest -t vivekthite/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vivekthite/multi-server:latest -t vivekthite/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vivekthite/multi-worker:latest -t vivekthite/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vivekthite/multi-client:latest
docker push vivekthite/multi-server:latest
docker push vivekthite/multi-worker:latest

docker push vivekthite/multi-client:$SHA
docker push vivekthite/multi-server:$SHA
docker push vivekthite/multi-worker:$SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=vivekthite/multi-server:$SHA
kubectl set image deployments/client-deployment client=vivekthite/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=vivekthite/multi-worker:$SHA