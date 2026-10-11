variable "cloudformation_type_lookup" {
  description = <<EOT
Map of cloudformation_type_lookup, attributes below
Optional:
    - arn
    - region
    - type
    - type_name
    - version_id
EOT

  type = map(object({
    arn        = optional(string)
    region     = optional(string)
    type       = optional(string)
    type_name  = optional(string)
    version_id = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudformation_type_lookup : (
        v.type_name == null || ((length(v.type_name) >= 10 && length(v.type_name) <= 204) && (can(regex("[0-9A-Za-z]{2,64}::[0-9A-Za-z]{2,64}::[0-9A-Za-z]{2,64}(::MODULE){0,1}", v.type_name))))
      )
    ])
    error_message = "all of: must be between 10 and 204 characters; three alphanumeric character sections separated by double colons (::)"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

