class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_moderator, :require_author

  def current_user
    @current_user = User.find_by_session_token(session[:session_token])
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def logout
    @user = current_user
    @user.reset_session_token!
    session[:session_token] = nil
  end

  def require_moderator
    unless current_user == @sub.moderator
      flash[:errors] = ["Only moderator can edit/destroy sub"]
      redirect_to sub_url(@sub)
    end
  end

  def require_author
    @post = Post.find_by_id(params[:id])
    unless current_user == @post.author
      flash[:errors] = ["Only author can edit/destroy sub"]
      redirect_to post_url(@post)
    end
  end
end
