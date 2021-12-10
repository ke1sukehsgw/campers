class TweetsController < ApplicationController
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
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    if @tweet.update(tweet_params)
      redirect_to tweet_path, method: :patch
    else
      render edit_tweet_path
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  def tweet_params
    params.require(:tweet).permit(:location_title, :prefectures, :image).merge(user_id: current_user.id)
  end
end
