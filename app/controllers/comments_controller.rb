class CommentsController < ApplicationController

def new
  @topic = Topic.find(params[:topic_id])
  @comment = Comment.new
end

def create
    @comment = Comment.create(comment: comment_params[:comment], topic_id: comment_params[:topic_id], user_id: current_user.id)
    redirect_to "/topics/#{@comment.topic_id}"
end

private
def comment_params
    params.require(:comment).permit(:comment).merge(topic_id: params[:topic_id], user_id: params[:user_id])
end


end
