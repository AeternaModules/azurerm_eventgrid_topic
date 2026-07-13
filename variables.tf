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
  # --- Unconfirmed validation candidates, derived from azurerm_eventgrid_topic's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: input_schema
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: inbound_ip_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

