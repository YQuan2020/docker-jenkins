.PHONY: build

NAME=jenkins
REGISTRY=registry.cn-hangzhou.aliyuncs.com
NAMESPACE=provide-a-name
TAG=betal


build:
	docker build -t ${REGISTRY}/${NAMESPACE}/${NAME}:${TAG} .
	docker push ${REGISTRY}/${NAMESPACE}/${NAME}:${TAG}
