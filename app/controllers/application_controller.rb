class ApplicationController < ActionController::Base
    include Authorization
    include Authentication
    include Language
    include Pagy::Backend
    include Error
end
