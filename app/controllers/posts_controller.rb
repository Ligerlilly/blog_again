class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  before_action :find_tags, only: [:index, :new, :edit]

  def index
    @tags = Tag.all
    @posts = Post.all.order( 'created_at desc')
  end

  def new
    @tags = Tag.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    params[:tags].each do |tag|
      @post.tags << Tag.find_by_name(tag)
    end
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit

  end


  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def tag_params
    params.require(:tags).permit(:name)
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_tags
    @tags = Tag.all
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
