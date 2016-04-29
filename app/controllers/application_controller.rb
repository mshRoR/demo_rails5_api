# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include ActionController::Serialization
  before_action :authenticate_request
  attr_reader :current_user

  def default_serializer_options
    {root: false}
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorize' }, status: 401 unless @current_user
  end
end
