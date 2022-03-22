# Tested with :  AzureRM version 2.88.1
# Ref : https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/storage_table

resource "azurerm_storage_table" "table" {
  name                  = var.settings.name
  storage_account_name  = var.storage_account_name
  
  dynamic "acl" {
    for_each = var.settings.acl

    content {
      id    = acl.value.id

      dynamic "access_policy" {
        for_each = try(rule.value.filters, {})

        content {
          expiry = try(access_policy.value.expiry, null)
          permissions = try(access_policy.value.permissions, null)
          start = try(access_policy.value.start, null)
        }

      }
    }
  }
}


  