class TopicsController < ApplicationController
before_action :set_sidebar_topics
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

private

def set_sidebar_topics
  @side_bar_topics = Topic.with_blogs
end


end