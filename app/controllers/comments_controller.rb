class CommentsController < ApplicationController
  before_action :load_commentable

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
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def load_commentable
    @commentable = params[:comment][:commentable_type].singularize.classify.constantize.find(params[:comment][:commentable_id])
  end

end
