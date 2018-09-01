class TopicsController < ApplicationController

before_action :move_to_index, except: [:index,:show]

def index
  @topics = Topic.order("created_at DESC").includes(:user).page(params[:page]).per(5)
end

def show
  @topic = Topic.find(params[:id])
  @comments = @topic.comments.includes(:user)
end

def edit
  @topic = Topic.find(params[:id])
end

 def update
   topic = Topic.find(params[:id])
   if topic.user_id == current_user.id
     topic.update(topic_params)
  end
     redirect_to action: :index
 end

 def destroy
   topic = Topic.find(params[:id])
   if topic.user_id == current_user.id
     topic.destroy
   end
   redirect_to action: :index
 end


def new
  @topic = Topic.new
end

def create
  Topic.create(title: topic_params[:title], text: topic_params[:text], user_id: current_user.id)
  redirect_to action: :index
end

private
def topic_params
  params.require(:topic).permit(:nickname,:title,:text)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end


end
