locals {
  tags_hmcts = local.tags_business_units.hmcts
}

resource "aws_organizations_account" "hmcts_fee_remissions" {
  name                       = "HMCTS Fee Remissions"
  email                      = replace(local.aws_account_email_addresses_template, "{email}", "fee-remission")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.hmcts.id

  tags = merge(local.tags_hmcts, {
    application   = "Fee Remissions",
    is-production = true
  })

  lifecycle {
    ignore_changes = [
      email,
      iam_user_access_to_billing,
      name,
      role_name,
    ]
  }
}

resource "aws_organizations_account" "manchester_traffic_dev" {
  name                       = "Manchester Traffic Dev"
  email                      = replace(local.aws_account_email_addresses_template, "{email}", "manchester-traffic-dev")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.hmcts.id

  tags = merge(local.tags_hmcts, {
    application = "Manchester Traffic"
  })

  lifecycle {
    ignore_changes = [
      email,
      iam_user_access_to_billing,
      name,
      role_name,
    ]
  }
}

resource "aws_organizations_account" "ministry_of_justice_courtfinder_prod" {
  name                       = "Ministry of Justice Courtfinder Prod"
  email                      = replace(local.aws_account_email_addresses_template, "{email}", "courtfinder-prod")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.hmcts.id

  tags = local.tags_hmcts

  lifecycle {
    ignore_changes = [
      email,
      iam_user_access_to_billing,
      name,
      role_name,
    ]
  }
}

resource "aws_organizations_account" "moj_info_services_dev" {
  name                       = "MoJ Info Services Dev"
  email                      = replace(local.aws_account_email_addresses_template, "{email}", "courtfinder")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.hmcts.id

  tags = local.tags_hmcts

  lifecycle {
    ignore_changes = [
      email,
      iam_user_access_to_billing,
      name,
      role_name,
    ]
  }
}

resource "aws_organizations_account" "tp_hmcts" {
  name                       = "TP-HMCTS"
  email                      = replace(local.aws_account_email_addresses_template, "{email}", "TP-HMCTS")
  iam_user_access_to_billing = "ALLOW"
  parent_id                  = aws_organizations_organizational_unit.hmcts.id

  tags = local.tags_hmcts

  lifecycle {
    ignore_changes = [
      email,
      iam_user_access_to_billing,
      name,
      role_name,
    ]
  }
}
