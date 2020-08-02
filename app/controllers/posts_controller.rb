class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      binding.pry
      redirect_to root_path, notice: '成長を記録しました'
    else
      flash.now[:alert] = '成長の記録に失敗しました'
      render 'new'
    end
  end

  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
