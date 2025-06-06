Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get("/login", { :controller => "sessions", :action => "new" })
  post("/login", { :controller => "sessions", :action => "create" })
  delete("/logout", { :controller => "sessions", :action => "destroy" })
end
