class TweetsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
    if @tweet.update(tweet_params)
      redirect_to tweet_path, method: :patch
    else
      render edit_tweet_path
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:location_title, :prefectures_id, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
