require 'spec_helper'

describe Like do
  it "creates a link between a user and their crush" do
    user = mock("User", id: 1)
    crush = mock("User", id: 2)
    link = Like.create_link(user, crush)
    link.user_id.should eq user.id
    link.crush.should eq crush.id
  end

  it "retrieves crush ids for a given user" do
    user = mock("User", id: 1)
    crush1 = mock("User", id: 2)
    crush2 = mock("User", id: 3)
    Like.create_link(user, crush1)
    Like.create_link(user, crush2)
    links = Like.crush_ids_for(user)
    links.should include crush1.id
    links.should include crush2.id
  end
end
