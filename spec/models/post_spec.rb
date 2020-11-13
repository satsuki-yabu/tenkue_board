require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:comment) { create(:comment, post: post) }

  it '記事の中身が空白の場合、無効' do
    post = build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it '記事の本文が１４０文字を超える場合、無効' do
    post = build(:post, content: 'a' * 141)
    post.valid?
    expect(post.errors[:content]).to include("は140文字以内で入力してください")
  end

  it '記事の本文が１４０文字以内の場合、有効' do
    post = build(:post, content: 'a' * 140)
    post.user_id = nil
    expect(post).to_not be_valid
  end
end
