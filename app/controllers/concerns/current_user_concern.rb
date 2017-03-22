module CurrentUserConcern
    extend ActiveSupport::Concern

  #overrides the devise current_user method, in rails you can override methods here. super means parent
  def current_user
    super || guest_user
  end
  
  def guest_user
  guest = GuestUser.new
  guest.name = "Guest User"
  guest.first_name = "Guest"
  guest.last_name = "User"
  guest.email = "Guest@example.com"
  guest
  end

end