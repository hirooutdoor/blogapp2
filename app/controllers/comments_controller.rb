class CommentsController < ApplicationController
    def new
        article = Article.find(params[:article_id])
        @comment = article.comments.build
    end

    def create
        article = Article.find(params[:article_id])
        @comment = article.comments.build(comment_params)
        if @comment.save #render :newするときに＠（インスタンス変数）にしていないと使えない
            redirect_to article_path(article), notice: '保存されました' #記事詳細ページに戻る
        else
            flash.now[:error] = '更新できませんでした'
            render :new 
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end
end