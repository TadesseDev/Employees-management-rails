# frozen_string_literal: true

class NewUserComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
