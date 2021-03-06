# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch
    has_rich_text :content

    validates :title, presence: true
    validates :title, length: { minimum: 3, maximum: 50}
    validates :title, format: { with: /\A(?!\@)/ }

    validates :content, presence: true

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user

    private
    def validate_title_and_content_length
        char_count = self.title.length + self.content.length
        unless char_count > 30
            errors.add(:content, 'タイトルと内容は合わせて30文字以上でお願いします')
        end
    end
end
