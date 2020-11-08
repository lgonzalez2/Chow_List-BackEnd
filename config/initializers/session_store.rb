if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_authentication_cookie", domain: "https://chow-list.herokuapp.com/"
else 
    Rails.application.config.session_store :cookie_store, key: "_authentication_cookie"
end 

