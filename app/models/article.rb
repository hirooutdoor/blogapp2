# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 3, maximum: 50}
    validates :title, format: { with: /\A(?!\@)/ }

    validates :content, presence: true
    validates :content, length: { minimum: 10, maximum: 3000 }
    validates :content, uniqueness: true

    validate :validate_title_and_content_length

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    private
    def validate_title_and_content_length
        char_count = self.title.length + self.content.length
        unless char_count > 30
            errors.add(:content, 'タイトルと内容は合わせて30文字以上でお願いします')
        end
    end
end