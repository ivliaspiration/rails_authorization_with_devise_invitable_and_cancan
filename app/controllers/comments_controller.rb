class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @article = Article.find(params[:article_id])
    comment = Comment.new(params[:comment])
    comment.user = current_user
    @article.comments << comment
    redirect_to article_path(@article)
  end
end
