output "eventgrid_topics" {
  description = "All eventgrid_topic resources"
  value       = azurerm_eventgrid_topic.eventgrid_topics
  sensitive   = true
}
output "eventgrid_topics_endpoint" {
  description = "List of endpoint values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.endpoint]
}
output "eventgrid_topics_identity" {
  description = "List of identity values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.identity]
}
output "eventgrid_topics_inbound_ip_rule" {
  description = "List of inbound_ip_rule values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.inbound_ip_rule]
}
output "eventgrid_topics_input_mapping_default_values" {
  description = "List of input_mapping_default_values values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.input_mapping_default_values]
}
output "eventgrid_topics_input_mapping_fields" {
  description = "List of input_mapping_fields values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.input_mapping_fields]
}
output "eventgrid_topics_input_schema" {
  description = "List of input_schema values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.input_schema]
}
output "eventgrid_topics_local_auth_enabled" {
  description = "List of local_auth_enabled values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.local_auth_enabled]
}
output "eventgrid_topics_location" {
  description = "List of location values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.location]
}
output "eventgrid_topics_name" {
  description = "List of name values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.name]
}
output "eventgrid_topics_primary_access_key" {
  description = "List of primary_access_key values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.primary_access_key]
  sensitive   = true
}
output "eventgrid_topics_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.public_network_access_enabled]
}
output "eventgrid_topics_resource_group_name" {
  description = "List of resource_group_name values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.resource_group_name]
}
output "eventgrid_topics_secondary_access_key" {
  description = "List of secondary_access_key values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.secondary_access_key]
  sensitive   = true
}
output "eventgrid_topics_tags" {
  description = "List of tags values across all eventgrid_topics"
  value       = [for k, v in azurerm_eventgrid_topic.eventgrid_topics : v.tags]
}

