resource "google_apikeys_key" "keys-tf" {
  name = "primary-basic-keys"
  display_name = "Keys created from terraform"

  restrictions {
    api_targets {
      service = "translate.googleapi.com"
      methods = [ "GET*" ]
    }
    browser_key_restrictions {
      allowed_referrers = [ ".*" ]
    }
  }
}