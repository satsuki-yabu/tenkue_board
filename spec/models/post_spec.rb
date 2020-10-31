require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post: post) }

  it '記事の中身が空白の場合、無効' do
    post = build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end
end