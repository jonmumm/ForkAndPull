class VideosController < ApplicationController

  respond_to :js, :html, :rss

  before_filter :find_videos

  def index
  end

  def show
    @video = Video.find params[:id]
  end

  private
  def find_videos
    @videos = Video.all
    @categories = Category.all
  end

end
