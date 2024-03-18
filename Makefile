.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: protoGen
protoGen: # Generating client and server code (.pb which contains all the protocol buffer code to populate, serialize, and retrieve request and response message types; _grpc.pb An interface type for clients and servers)
	protoc --go_out=./generated \
    --go-grpc_out=./generated \
    ./user/user.proto



