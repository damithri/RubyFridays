class NewsItemsController < ApplicationController
  def index
    @news_items=NewsItem.all
    @title="News Items"
      end
   def new
     @news_item=NewsItem.new
   end
   def create
     @news_item=NewsItem.create(params[:news_item])
     if @news_item.save
      redirect_to "/news_items"
     else
      redirect_to "/news_items/new"
     end
   end
 end
