.PHONY: check-name gen clean gen-auth

check-name:
ifndef l
	$(error Language is not set. Ex: "make <target> l=<name>")
endif

gen: check-name
	mkdir -p ./gen/$(l)/

clean:
	rm -rf ./gen


gen-auth: clean gen
ifeq ($(l), go)
	go mod tidy
	go get -u google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	
	protoc -I proto proto/auth/*.proto \
		--go_out=./gen/$(l)/ \
		--go_opt=paths=source_relative \
		--go-grpc_out=./gen/$(l)/ \
		--go-grpc_opt=paths=source_relative
	go mod tidy

else
	$(error Unknown language.)
endif