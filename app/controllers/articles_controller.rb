class ArticlesController < ApplicationController
  
  def index
    @items = Item.all
  end
end
