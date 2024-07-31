## Getting Started with Terraform and the Fastly WAF 


### Initialize Terraform

Start by initializing Terraform:

```bash
terraform init
```

### Install Dependencies for the Provider

To use the Signal Sciences (Fastly WAF) provider, you need to have Go installed and build the provider. Follow the instructions in the [provider documentation](https://registry.terraform.io/providers/signalsciences/sigsci/latest/docs#requirements).

Build the provider with these commands:

```bash
git clone git@github.com:signalsciences/terraform-provider-sigsci.git
cd terraform-provider-sigsci
make build
```

### Configure the Environment

Export the environment variable for the Terraform CLI configuration. It may also be helpful to add this to your `bashrc` or `zshrc` for convenience:

```bash
export TF_CLI_CONFIG_FILE=/Users/antoine/Documents/code/playground/terraform-provider-sigsci/bin/developer_overrides.tfrc
```

### Update `main.tf`

In your `main.tf`, configure the provider as follows:

```hcl
terraform {
  required_providers {
    sigsci = {
      source  = "signalsciences/sigsci"
      version = "1.0.0" # Use the appropriate version you have set
    }
  }
}
```

### Provider Configuration Explanation

The `source = "signalsciences/sigsci"` setting in `main.tf` corresponds to the path where the provider was built and stored:

```
/Users/antoine/Documents/code/playground/terraform-provider-sigsci/bin/
```

In the file `developer_overrides.tfrc`, you'll see:

```hcl
provider_installation {
  dev_overrides {
    "signalsciences/sigsci" = "/Users/antoine/Documents/code/playground/terraform-provider-sigsci/bin"
  }

  direct {}
}
```

The `signalsciences/sigsci` reference is used in the `main.tf` file to link to the local provider.

### Terraform Commands

You can now validate, plan, and apply your Terraform configuration:

```bash
terraform validate
terraform plan
terraform apply -parallelism=1
```

Note: Errors may occur when updating certain resources. If this happens, try re-running the command with `-parallelism=1`.

### Example Configuration

Here's an example to apply a list configuration:

```hcl
terraform {
  required_providers {
    sigsci = {
      source  = "signalsciences/sigsci"
      version = "1.0.0" # Use the appropriate version you have set
    }
  }
}

provider "sigsci" {
  corp       = "your_corp_name"       # Required. May also provide via env variable SIGSCI_CORP
  email      = "yourEmail@gmail.com"  # Required. May also provide via env variable SIGSCI_EMAIL
  auth_token = "THE_API_KEY"           # May also provide via env variable SIGSCI_TOKEN
  # password = ""                      # May also provide via env variable SIGSCI_PASSWORD
  # fastly_api_key = ""               # May also provide via env variable FASTLY_API_KEY. Required for Edge Deployments functionality.
}

resource "sigsci_corp_list" "test" {
  name        = "My corp list"
  type        = "ip"
  description = "Some IPs"
  entries = [
    "4.5.6.7",
    "2.3.4.5",
    "1.2.3.4",
  ]
}
```

### Using Variables

Using variables helps avoid repetition and makes your code more reusable. Here's an example of defining and using a variable:

In `variables.tf`:

```hcl
variable "sigsci_site" {
  description = "The site we are working with in Signal Sciences"
  type        = string
}
```

In `terraform.tfvars`:

```hcl
sigsci_site = "antoine-training-site"
```

In your resource configuration:

```hcl
resource "sigsci_site_signal_tag" "loginpwdreset" {
  site_short_name = var.sigsci_site
  name            = "loginPwdReset"
  description     = "Prevent scripted attempts for login/password resets"
}
```

## Documentation

For more information and examples, refer to the [sigsci-terraform-examples](https://github.com/rickyaustin/sigsci-terraform-examples) repository.

