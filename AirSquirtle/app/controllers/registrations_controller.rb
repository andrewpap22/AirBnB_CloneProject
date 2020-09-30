class RegistrationsController < Devise::RegistrationsController
  protected
  def update_resource(resource, params)
    resource.update_without_password(params) #if u want to update the profile, do that without requiring password confirmation
  end
end