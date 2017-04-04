class TopicsController < ApplicationController
layout 'blog'

def show
  @topic = Topic.find(params[:id])
  
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topics.blogs.published.recent.page(params[:page]).per(5)
    end
end

def index
  @topics = Topic.all
end


end