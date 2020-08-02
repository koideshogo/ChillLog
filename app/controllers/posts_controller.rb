class PostsController < ApplicationController
  
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: '成長を記録しました'
    else
      flash.now[:alert] = '成長の記録に失敗しました'
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice:'成長記録が更新されました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
