class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: {
      data: articles,
      msg: "list retrieval successful"
    }, status: 200
  end

  def show
    article = Article.find_by(id: params[:id])

    if article
      render json: {
        data: article,
        msg: "retrieval successful"
      }, status: 200
    else
      render json: {
        error: "not found"
      }, status: 404
    end
  end

  def create
    article = Article.new(
      title: arti_params[:title],
      body: arti_params[:body],
      author: arti_params[:author]
    )

    if article.save
      render json: {
        data: article,
        msg: "creation successful"
      }, status: 200
    else
      render json: {
        error: "Error creating.."
      }
    end
  end

  def update
    article = Article.find_by(id: params[:id])

    if article
      # do update and save
      article.update(title: params[:title], body: params[:body], author: params[:author])

      render json: {
        data: article,
        msg: "update successful"
      }, status: 200

    else
      render json: {
        error: "not found"
      }, status: 404
    end
  end

  def destroy
    # delete and inform
    article = Article.find_by(id: params[:id])

    if article
      # do update and save
      if article.destroy
        render json: {
          msg: "deletion successful"
        }, status: 200
      else
        render json: {
          msg: "deletion failed"
        }, status: 500
      end

    else
      render json: {
        error: "not found"
      }, status: 404
    end
  end

  private

  def arti_params
    params.require(:article).permit(
      :title,
      :body,
      :author
    )
  end
end
