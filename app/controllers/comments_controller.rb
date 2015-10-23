class CommentsController < ApplicationController
  before_action :load_commentable, except: [:destroy, :edit]

  def new
    @commment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to  "/#{params[:comment][:commentable_type]}/#{@commentable.id}", notice: 'Comment saved!'
    else
      redirect_to root_path, alert: "Didn't save comment"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if @comment.commentable_type == 'User'
      @user = User.find(@comment.commentable_id)
    else
      @post = Post.find(@comment.commentable_id)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to  "/#{params[:comment][:commentable_type]}/#{@commentable.id}", notice: 'Comment saved!'
    else
      redirect_to root_path, alert: "Didn't save comment"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    resource = @comment.commentable_type.pluralize.downcase
    id = @comment.commentable_id
    @comment.destroy
    redirect_to "/#{resource}/#{id}", alert: 'Comment deleted!'
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def load_commentable
    @commentable = params[:comment][:commentable_type].singularize.classify.constantize.find(params[:comment][:commentable_id])
  end

end
