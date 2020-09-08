docker build -t mbeldo/multi-client -f ./client/Dockerfile ./client
docker build -t mbeldo/multi-server -f ./server/Dockerfile ./server
docker build -t mbeldo/multi-worker -f ./worker/Dockerfile ./worker
docker push mbeldo/multi-client
docker push mbeldo/multi-server
docker push mbeldo/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment