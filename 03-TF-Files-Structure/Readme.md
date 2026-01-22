| Filename             | Purpose                                  |
| -------------------- | ---------------------------------------- |
| `backend.tf`         | Remote backend config (state storage)    |
| `provider.tf`        | Provider config (Azure, AWS, etc.)       |
| `resource-group.tf`  | Resource group resource definition       |
| `storage-account.tf` | Storage account resource definition      |
| `local.tf`           | Local variables and computed values      |
| `variables.tf`       | Input variable declarations              |
| `terraform.tfvars`   | Input variable values overrides          |
| `output.tf`          | Output variables to expose resource info |

###########**implicit vs explicit** dependencies in Terraform ############
**Implicit Dependency**:
* Terraform automatically understands the order of resources based on references.
* You don’t need to specify anything; Terraform uses the fact that one resource depends on another.
Example:
  resource "azurerm_resource_group" "rg" {
  name     = "learning-resources"
  location = "UK West"
  }

resource "azurerm_storage_account" "storage" {
name                     = "azdevopsvenkat"
resource_group_name      = azurerm_resource_group.rg.name  # <-- reference
location                 = azurerm_resource_group.rg.location  # <-- reference
account_tier             = "Standard"
account_replication_type = "LRS"
}

Here, the storage account implicitly depends on the resource group because we referenced azurerm_resource_group.rg.name. 
Terraform automatically creates the RG first.

**Explicit Dependency**:
* Sometimes, Terraform cannot detect a dependency automatically.
* You can force a dependency using the depends_on argument.
* Useful when resources don’t reference each other, but one must be created first.
Example :
resource "azurerm_resource_group" "rg" {
  name     = "learning-resources"
  location = "UK West"
  }

resource "azurerm_storage_account" "storage" {
name                     = "azdevopsvenkat"
resource_group_name      = azurerm_resource_group.rg.name
location                 = azurerm_resource_group.rg.location
account_tier             = "Standard"
account_replication_type = "LRS"

depends_on = [ azurerm_resource_group.rg ]
}

Here, depends_on explicitly tells Terraform:
"Create the resource group first, then create the storage account"

Even if Terraform could detect it, sometimes depends_on ensures the order of operations, 
especially with modules or complex resources.