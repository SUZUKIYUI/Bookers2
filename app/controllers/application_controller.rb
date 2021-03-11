class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_book

  def new_book
    @new_book=Book.new
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:name])
  end

end
