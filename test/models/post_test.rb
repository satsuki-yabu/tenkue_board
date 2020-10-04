require 'rails_helper'
describe Post do

  it "failed without content" do
    post = build(:post, content: nil)
    expect(post).not_to be_valid
  end

  it "success within 140 characters" do
    post = build(:post, content: "あ" * 140)
    expect(post).to be_valid
  end

  it "failed over 140 characters" do
    post = build(:post, content: "あ" * 141)
    expect(post).not_to be_valid
  end
end
