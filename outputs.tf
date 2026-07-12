output "eventgrid_topics_endpoint" {
  description = "Map of endpoint values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.endpoint }
}
output "eventgrid_topics_identity" {
  description = "Map of identity values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.identity }
}
output "eventgrid_topics_inbound_ip_rule" {
  description = "Map of inbound_ip_rule values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.inbound_ip_rule }
}
output "eventgrid_topics_input_mapping_default_values" {
  description = "Map of input_mapping_default_values values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.input_mapping_default_values }
}
output "eventgrid_topics_input_mapping_fields" {
  description = "Map of input_mapping_fields values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.input_mapping_fields }
}
output "eventgrid_topics_input_schema" {
  description = "Map of input_schema values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.input_schema }
}
output "eventgrid_topics_local_auth_enabled" {
  description = "Map of local_auth_enabled values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.local_auth_enabled }
}
output "eventgrid_topics_location" {
  description = "Map of location values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.location }
}
output "eventgrid_topics_name" {
  description = "Map of name values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.name }
}
output "eventgrid_topics_primary_access_key" {
  description = "Map of primary_access_key values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.primary_access_key }
  sensitive   = true
}
output "eventgrid_topics_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.public_network_access_enabled }
}
output "eventgrid_topics_resource_group_name" {
  description = "Map of resource_group_name values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.resource_group_name }
}
output "eventgrid_topics_secondary_access_key" {
  description = "Map of secondary_access_key values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.secondary_access_key }
  sensitive   = true
}
output "eventgrid_topics_tags" {
  description = "Map of tags values across all eventgrid_topics, keyed the same as var.eventgrid_topics"
  value       = { for k, v in azurerm_eventgrid_topic.eventgrid_topics : k => v.tags }
}

