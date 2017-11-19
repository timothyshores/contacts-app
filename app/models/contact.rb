class Contact < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    return first_name + " " + last_name
  end

  def japanese_phone_number
    return "+81 " + phone_number[0..2] + " " + phone_number[3..5] + " " + phone_number[6..9]
  end

  def as_json 
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      japanese_phone_number: japanese_phone_number,
      friendly_created_at: friendly_created_at
    }
  end

end
