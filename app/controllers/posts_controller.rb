class PostsController < ApplicationController
    before_action :authenticate_user!, only: :new

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
     @post = current_user.posts.build
    end


    def create
      @post = current_user.posts.build(post_params)

      if @post.save


      redirect_to posts_path
    else
        render 'new'
    end

    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
        params.require(:post).permit(:content, :answer)
    end

    # def edit
    #     @post = Post.find(params[:id])
    # end

end
