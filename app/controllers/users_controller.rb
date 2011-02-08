class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @title = I18n.translate("helpers.legend.all_user")
    @users = User.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 50)
    @title = @user.name
  end

  def new
    @user = User.new
    @title = I18n.translate("helpers.legend.title_sing_up")
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = I18n.translate("helpers.legend.welcome")
      redirect_to @user
    else
      @title = I18n.translate("helpers.legend.sing_up")
      render 'new'
    end
  end

  def edit
    @title = I18n.translate("helpers.legend.edit_user")
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = I18n.translate("helpers.legend.profile_updated")
      redirect_to @user
    else
      @title = I18n.translate("helpers.legend.edit_user")
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.translate("helpers.legend.user_destroyed")
    redirect_to users_path
  end

  def following
    show_follow(:following)
  end

  def followers
    show_follow(:followers)
  end

  def show_follow(action)
    @title = action.to_s.capitalize
    @user = User.find(params[:id])
    @users = @user.send(action).paginate(:page => params[:page])
    render 'show_follow'
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

