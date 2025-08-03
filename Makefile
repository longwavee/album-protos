.PHONY: check-name gen clean

check-name:
ifndef l
	$(error Language is not set. Ex: "make <target> l=<name>")
endif

gen: check-name
	mkdir -p ./gen/$(l)/

clean:
	rm -rf ./gen