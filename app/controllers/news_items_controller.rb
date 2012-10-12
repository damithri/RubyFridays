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
   def edit
     @news_item=NewsItem.find(params[:id])
   end
   def update
     @news_items=NewsItem.find(params[:id])
     @news_items.update_attributes(params[:news_item])
     @news_items.save
     redirect_to "/news_items"
   end
 end
