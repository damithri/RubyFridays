# hello this is a change
class NewsItemsController < ApplicationController
  def index
    @news_items=NewsItem.all
    @title="News Items"
    @news_item=NewsItem.new #added this here to reference partial and to invoke the new action because we're calling it from the index page now.
  
    respond_to do |format|
      format.html {}
      format.json { render :json => @news_items.to_json } 
    end
  
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
    @news_item=NewsItem.find(params[:id])
    @news_item.update_attributes(params[:news_item])
    @news_item.save
    redirect_to "/news_items"
  end

  def destroy
    @news_item=NewsItem.find(params[:id])
    @news_item.destroy
    redirect_to "/news_items"
  end

  def show
    @news_item=NewsItem.find(params[:id])
  end
end
