class HomeController < ApplicationController
  def index
    @title = 'デイトラ'
  end

  def about
    @about = 'About'
  end
end
