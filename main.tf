resource "aws_cognito_user_pool" "this" {
  name = var.name

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  password_policy {
    minimum_length                   = var.password_policy.minimum_length
    require_lowercase                = var.password_policy.require_lowercase
    require_numbers                  = var.password_policy.require_numbers
    require_symbols                  = var.password_policy.require_symbols
    require_uppercase                = var.password_policy.require_uppercase
    temporary_password_validity_days = var.password_policy.temporary_password_validity_days
  }
}

resource "aws_cognito_user_pool_client" "this" {
  for_each        = var.clients
  user_pool_id    = aws_cognito_user_pool.this.id
  name            = each.key
  generate_secret = each.value.generate_secret
}