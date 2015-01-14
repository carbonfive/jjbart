# app/controllers/api_controller.rb
require 'bart_service'

class ApiController < ApplicationController
	include ActionController::ImplicitRender
	
	def initialize
		@bart = BartService.new
	end

	def respond_as_not_found
  		raise ActionController::RoutingError.new('Not Found')
	end
end

