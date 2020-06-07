# Directories
TOOLS_DIR := $(PWD)/hack/tools
TOOLS_BIN_DIR := $(TOOLS_DIR)/bin
BIN_DIR := bin

# Binaries
KUSTOMIZE := $(TOOLS_BIN_DIR)/kustomize

build-staging: $(KUSTOMIZE)
	$(KUSTOMIZE) build staging/eastus2euap

bootstrap-staging: $(KUSTOMIZE)
	$(KUSTOMIZE) build staging/eastus2euap | kubectl apply -f -

# Dependencies
$(KUSTOMIZE): $(TOOLS_DIR)/go.mod # Build kustomize from tools folder.
	cd $(TOOLS_DIR); go build -tags=tools -o $(BIN_DIR)/kustomize sigs.k8s.io/kustomize/kustomize/v3
