class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)
    @post.likes.build()
    
    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def add_like
    @post = Post.find(params[:post_id])
    if @post
      @post.likes[0].like_count +=1

      if @post.likes[0].save
        respond_to do |format|
          format.json { render :show, status: :ok }
        end
      end
    end
  end

  def add_like
    @post = Post.find(params[:post_id])
    if @post
      @post.likes[0].like_count +=1

      if @post.likes[0].save
        respond_to do |format|
          format.json { render :show, status: :ok }
        end
      end
    end
  end

  private
    def post_params
      params.permit(:caption, :image)
    end
end
