module "storage_account_tables" {
  source               = "./modules/storage_account/table"
  for_each             = local.storage.storage_account_tables
  storage_account_name = module.storage_accounts[each.value.storage_account_key].name
  settings             = each.value

}

output "storage_account_tables" {
  value = module.storage_account_tables

}