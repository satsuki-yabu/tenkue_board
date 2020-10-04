require 'test_helper'

class PostTest < ActiveSupport::TestCase

RSpec.describe Post, type: :model do
    it "is valid with content" do
      post = Posts.new(
        content: コメント
      )
      expect(post).to be_valid
    end
end
end
