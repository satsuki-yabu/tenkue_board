require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'コメントの中身が空白であると無効' do
    comment = build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("を入力してください")
  end

  it 'コメントの中身が空白でないと有効' do
    comment = build(:comment, content:'この記事は編集、削除できません。')
    expect(comment).to be_valid
  end
end