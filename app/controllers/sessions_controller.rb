class SessionsController < ApplicationController
  def new
    @title = I18n.translate("helpers.legend.title_sing_in")
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = I18n.translate("helpers.legend.invalid_email_password")
      @title = I18n.translate("helpers.legend.title_sing_in")
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

