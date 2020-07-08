class UsersController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update,:show,:index]
    before_action :correct_user, only: [:edit, :update]
    def show
        @user = User.find(params[:id])
        @posts =@user.posts.order(id: "DESC").page(params[:page]).per(5)
        p_point=0
        @posts.each do |point|
            p_point+=point.point
        end
        @av_point=p_point.fdiv(@posts.count).round(2)

    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        unless params[:user][:user_image].blank?
            @user.user_image = params[:user][:user_image].read
        end
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render :edit
        end
    end


    def index
        @users = User.all
        
    end

    def show_user_image
        @user = User.find(params[:id])
        send_data @user.user_image, :type => 'image/jpeg', :disposition => 'inline'
    end


    private
    def user_params
        params.require(:user).permit(:name,:introduction,:average)
    end
    def signed_in_user
        redirect_to new_user_session_path, notice: "Please sign in." unless signed_in?
    end
    def correct_user
        @user=User.find(params[:id])
        redirect_to user_path(current_user.id) unless @user==current_user
    end
end
