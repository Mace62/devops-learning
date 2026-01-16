locals {
    state_path = "${path_relative_to_include()}/terraform.tfstate"
}

# Bad practice to put remote state in the root module
remote_state {
    backend = "local"
    config = {
        path = local.state_path
    }
}
