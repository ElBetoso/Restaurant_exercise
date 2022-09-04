class StaticPagesController < ApplicationController
  skip_before_action :protect_pages
  def home
  end

  def help
  end
end
