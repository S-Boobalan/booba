# OPG OU: DigiCop
resource "aws_organizations_account" "moj-opg-digicop-production" {
  name      = "MoJ OPG DigiCop Production"
  email     = local.account_emails["MoJ OPG DigiCop Production"][0]
  parent_id = aws_organizations_organizational_unit.opg-digicop.id

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

resource "aws_organizations_policy_attachment" "moj-opg-digicop-production" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-opg-digicop-production.id
}

resource "aws_organizations_account" "moj-opg-digicop-development" {
  name      = "MoJ OPG DigiCop Development"
  email     = local.account_emails["MoJ OPG DigiCop Development"][0]
  parent_id = aws_organizations_organizational_unit.opg-digicop.id

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

resource "aws_organizations_policy_attachment" "moj-opg-digicop-development" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-opg-digicop-development.id
}

resource "aws_organizations_account" "moj-opg-digicop-preproduction" {
  name      = "MoJ OPG DigiCop Preproduction"
  email     = local.account_emails["MoJ OPG DigiCop Preproduction"][0]
  parent_id = aws_organizations_organizational_unit.opg-digicop.id

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

resource "aws_organizations_policy_attachment" "moj-opg-digicop-preproduction" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-opg-digicop-preproduction.id
}