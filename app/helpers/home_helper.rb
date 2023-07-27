module HomeHelper
  def get_user_name(user_id)
    user = User.find(user_id)
    user.name
  end
end
