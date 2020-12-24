class Apps::TimelinesController < Apps::ApplicationController

    def show
        #自分がフォローしている人のidを取得して記事を取得したい
        user_ids = current_user.followings.pluck(:id)
        #そのユーザーたちのidの記事を取得したい
        @articles = Article.where(user_id: user_ids)
        #user_idsに含まれているどれかのuser_idの記事を探してくるという意味、それを@articleとする
    end

end