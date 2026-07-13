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
        - ip_mask (optional)
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
    input_schema                  = optional(string)
    local_auth_enabled            = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    inbound_ip_rule = optional(list(object({
      action  = optional(string)
      ip_mask = optional(string)
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
        (length(v.name) > 0) && (can(regex("^[-a-zA-Z0-9]{3,50}$", v.name)))
      )
    ])
    error_message = "all of: must not be empty; EventGrid topic name must be 3 - 50 characters long, contain only letters, numbers and hyphens."
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_topics : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_topics : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_topics : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.eventgrid_topics : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

