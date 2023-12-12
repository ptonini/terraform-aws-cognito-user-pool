variable "name" {}

variable "allow_admin_create_user_only" {
  default = true
}

variable "password_policy" {
  type = object({
    minimum_length                   = optional(number, 8)
    require_lowercase                = optional(bool, false)
    require_numbers                  = optional(bool, false)
    require_symbols                  = optional(bool, false)
    require_uppercase                = optional(bool, false)
    temporary_password_validity_days = optional(number, 7)
  })
  default = {}
}

variable "clients" {
  type = map(object({
    generate_secret = bool
  }))
  default = {}
}