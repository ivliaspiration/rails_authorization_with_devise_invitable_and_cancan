class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @article.comments.create(params[:comment])
    redirect_to article_path(@article)
  end
end
