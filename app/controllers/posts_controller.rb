class PostsController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update,:new,:create, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def index
        @posts =Post.all.order(created_at: "DESC").page(params[:page]).per(5)
    end

    def new
        @post=Post.new
    end

    def show_post
        @post = Post.find(params[:id])
        send_data @post.picture, :type => 'image/jpeg', :disposition => 'inline'
    end

    def create
        @post=Post.new(posts_params)
        @post.user_id=current_user.id
        
        unless params[:post][:picture].blank?
            @post.picture = params[:post][:picture].read
        end
        if @post.save
            flash[:success] = "投稿が完了しました"
          redirect_to posts_path
        else
            flash[:error] = "未記入もしくは文字数オーバーの項目があります"
          render :new
        end

    
    end

    def show
        @post=Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(posts_params)
            flash[:success] = "投稿の編集が完了しました"
            redirect_to post_path(@post.id)
        else
            flash[:error] = "未記入の項目があります"
            render :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to posts_path
        else
            render :index
        end
    end

    private
    def posts_params
        params.require(:post).permit(:picture,:review,:store_name,:user_id,:vegetable, :garlic, :noodle, :pig, :backfat,:name)
    end
    def signed_in_user
        redirect_to new_user_session_path, notice: "Please sign in." unless signed_in?
    end
    def correct_user
        @post=Post.find(params[:id])
        redirect_to posts_path unless @post.user_id == current_user.id
    end
end
