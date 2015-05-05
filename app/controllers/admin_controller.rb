class AdminController < ApplicationController
  before_filter :authenticate_user!
end
