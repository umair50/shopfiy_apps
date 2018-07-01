ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "00686c43106843a87164096f9866f96c"
  config.secret = "694412cd98c39a14ab37e2eb614b7c1c"
  config.scope = "read_orders, read_products, read_themes, write_themes"
  config.embedded_app = true

  # config.redirect_uri = "https://localhost:3000/auth/shopify/callback"
  config.after_authenticate_job = false
  config.session_repository = Shop
  shop_url = "https://#{'00686c43106843a87164096f9866f96c'}:#{'JackDaniels2112$'}@#{'fit-gym-parts'}.myshopify.com/admin"
  ShopifyAPI::Base.site = shop_url
  session = ShopifyAPI::Session.new("fit-gym-parts.myshopify.com")
  ShopifyAPI::Session.setup(api_key: "00686c43106843a87164096f9866f96c", secret: "694412cd98c39a14ab37e2eb614b7c1c")
  
end
