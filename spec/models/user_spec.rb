require 'spec_helper'

describe User do
  subject { User.create }
  let(:doug) { User.create }
  let(:jane) { User.create }
  let(:chris) { User.create }

  it { should_not be_nil }

  it "can like other users" do
  	doug.like(jane).should be_true
  end

  it "cannot like oneself" do
  	expect{doug.like(doug)}.to raise_error(User::SelfLike)
  end

  it "can ask if it likes someone" do
  	doug.like(jane)
  	doug.likes?(jane).should be_true
  end

  it "stores a user's likes" do
  	doug.like(jane)
  	doug.likes.should include jane
  end

  it "returns false if user is not liked" do
  	doug.likes?(chris).should be_false
  end


end
