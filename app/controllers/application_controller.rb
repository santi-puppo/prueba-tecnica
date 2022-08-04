class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from Exception, with: :generic_exception
  rescue_from RangeError, with: :range_exception

  private

  def generic_exception(error)
    render json: { error: error.message }, status: :internal_server_error
  end

  def range_exception(error)
    render json: { error: error.message }, status: :range_not_satisfiable
  end
end
