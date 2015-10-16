class TagsController < ApplicationController
  before_action :find_tag, except: [:new, :create, :index]


  def index
    @tags = @post.tags
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @tag.destroy
    redirect_to posts_path
  end


  private
  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
