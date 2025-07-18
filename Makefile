.deps:
	go get -u google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

.gen-sso: .deps
	mkdir -p ./gen/go
	protoc -I proto proto/sso/*.proto \
		--go_out=./gen/go/ \
		--go_opt=paths=source_relative \
		--go-grpc_out=./gen/go/ \
		--go-grpc_opt=paths=source_relative
	go mod tidy

.PHONY: .deps .gen-sso