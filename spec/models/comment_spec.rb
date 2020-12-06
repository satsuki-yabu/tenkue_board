require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:comment) { create(:comment, post: post) }

  it 'コメントの中身が空白の場合、無効' do
    comment = build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("を入力してください")
  end

  it "コメントの中身がある場合、有効" do
    expect(comment).to be_valid
    comment.post_id = nil
    expect(comment).to_not be_valid	   
  end	 

  it 'コメントの中身が１４０文字を超える場合、無効' do
    comment = build(:comment, content: 'a' * 141)
    comment.valid?
    expect(comment.errors[:content]).to include("は140文字以内で入力してください")
  end

  it 'コメントの中身が１４０文字以内の場合、有効' do
    comment = build(:comment, content: 'a' * 140)
    expect(comment).to be_valid
  end
end