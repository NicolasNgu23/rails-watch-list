class BookmarksController < ApplicationController
  before_action :find_list, only: %i[new create]
  before_action :set_bookmark, only: %i[edit update show destroy]
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render template: 'lists/show'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
