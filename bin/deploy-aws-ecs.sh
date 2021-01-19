aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 585436692352.dkr.ecr.ap-northeast-1.amazonaws.com
docker build . -t yakult-admin
docker tag yakult-admin:latest 585436692352.dkr.ecr.ap-northeast-1.amazonaws.com/yakult-admin:latest
docker push 585436692352.dkr.ecr.ap-northeast-1.amazonaws.com/yakult-admin:latest