class PagesController < ApplicationController
  def home
    @title = I18n.translate("helpers.legend.home_title")
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 50)
    end
  end

  def contact
    @title = I18n.translate("helpers.legend.contact_title")
  end

  def about
    @title = I18n.translate("helpers.legend.about_title")
  end

  def help
    @title = I18n.translate("helpers.legend.help_title")
  end
end

