class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_country_id
    "+81 #{phone_number}"
  end
end
