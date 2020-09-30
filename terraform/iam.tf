data "aws_iam_policy_document" "terraform-organisation-management" {
  statement {
    sid    = "AllowOrganisationManagement"
    effect = "Allow"
    actions = [
      # Note that this doesn't grant any destructive permissions for AWS Organizations
      "iam:CreateServiceLinkedRole",
      "organizations:CreateAccount",
      "organizations:CreateOrganizationalUnit",
      "organizations:DescribeAccount",
      "organizations:DescribeCreateAccountStatus",
      "organizations:DescribeEffectivePolicy",
      "organizations:DescribeHandshake",
      "organizations:DescribeOrganization",
      "organizations:DescribeOrganizationalUnit",
      "organizations:DescribePolicy",
      "organizations:ListAccounts",
      "organizations:ListAccountsForParent",
      "organizations:ListAWSServiceAccessForOrganization",
      "organizations:ListChildren",
      "organizations:ListCreateAccountStatus",
      "organizations:ListDelegatedAdministrators",
      "organizations:ListDelegatedServicesForAccount",
      "organizations:ListHandshakesForAccount",
      "organizations:ListHandshakesForOrganization",
      "organizations:ListOrganizationalUnitsForParent",
      "organizations:ListParents",
      "organizations:ListPolicies",
      "organizations:ListPoliciesForTarget",
      "organizations:ListRoots",
      "organizations:ListTagsForResource",
      "organizations:ListTargetsForPolicy",
      "organizations:MoveAccount",
      "organizations:TagResource",
      "organizations:UntagResource",
      "organizations:UpdateOrganizationalUnit",
      "sts:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "terraform-organisation-management-policy" {
  name        = "TerraformOrganisationManagementPolicy"
  description = "A policy that allows the Modernisation Platform to manage organisations"
  policy      = data.aws_iam_policy_document.terraform-organisation-management.json
}

# Individual IAM user for the Modernisation Platform
resource "aws_iam_user" "terraform-organisation-management-user" {
  name          = "ModernisationPlatformOrganisationManagement"
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "terraform-organisation-management-attachment" {
  user       = aws_iam_user.terraform-organisation-management-user.name
  policy_arn = aws_iam_policy.terraform-organisation-management-policy.arn
}
