variable "eventgrid_topics" {
  description = <<EOT
Map of eventgrid_topics, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - input_schema
    - local_auth_enabled
    - public_network_access_enabled
    - tags
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - inbound_ip_rule (block):
        - action (optional)
        - ip_mask (required)
    - input_mapping_default_values (block):
        - data_version (optional)
        - event_type (optional)
        - subject (optional)
    - input_mapping_fields (block):
        - data_version (optional)
        - event_time (optional)
        - event_type (optional)
        - id (optional)
        - subject (optional)
        - topic (optional)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    input_schema                  = optional(string) # Default: "EventGridSchema"
    local_auth_enabled            = optional(bool)   # Default: true
    public_network_access_enabled = optional(bool)   # Default: true
    tags                          = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    inbound_ip_rule = optional(list(object({
      action  = optional(string) # Default: "Allow"
      ip_mask = string
    })))
    input_mapping_default_values = optional(object({
      data_version = optional(string)
      event_type   = optional(string)
      subject      = optional(string)
    }))
    input_mapping_fields = optional(object({
      data_version = optional(string)
      event_time   = optional(string)
      event_type   = optional(string)
      id           = optional(string)
      subject      = optional(string)
      topic        = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_topics : (
        v.inbound_ip_rule == null || (length(v.inbound_ip_rule) <= 128)
      )
    ])
    error_message = "Each inbound_ip_rule list must contain at most 128 items"
  }
}

