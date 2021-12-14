class HomeController < ApplicationController
  before_filter :authenticate_user!, only: %i(index)

  def index
  end

  def new
  end

end
