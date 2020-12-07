# Tactical Products OU
resource "aws_organizations_account" "tp-hmcts" {
  name      = "TP-HMCTS"
  email     = local.account_emails["TP-HMCTS"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "tp-hmcts" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.tp-hmcts.id
}

resource "aws_organizations_account" "tacticalproducts" {
  name      = "tacticalproducts"
  email     = local.account_emails["tacticalproducts"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "tacticalproducts" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.tacticalproducts.id
}

resource "aws_organizations_account" "tp-alb" {
  name      = "TP-ALB"
  email     = local.account_emails["TP-ALB"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "tp-alb" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.tp-alb.id
}

resource "aws_organizations_account" "moj-intranet" {
  name      = "MOJ Intranet"
  email     = local.account_emails["MOJ Intranet"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "moj-intranet" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-intranet.id
}

resource "aws_organizations_account" "ministry-of-justice-courtfinder-prod" {
  name      = "Ministry of Justice Courtfinder Prod"
  email     = local.account_emails["Ministry of Justice Courtfinder Prod"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "ministry-of-justice-courtfinder-prod" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.ministry-of-justice-courtfinder-prod.id
}

resource "aws_organizations_account" "tp-hq" {
  name      = "TP-HQ"
  email     = local.account_emails["TP-HQ"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "tp-hq" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.tp-hq.id
}

resource "aws_organizations_account" "moj-info-services-dev" {
  name      = "MoJ Info Services Dev"
  email     = local.account_emails["MoJ Info Services Dev"][0]
  parent_id = aws_organizations_organizational_unit.tactical-products.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_policy_attachment" "moj-info-services-dev" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-info-services-dev.id
}