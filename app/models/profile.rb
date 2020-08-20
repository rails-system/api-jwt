class Profile < ApplicationRecord
  belongs_to :user
  # gender_type for gender and with_whome
  enum gender_type: { female: 0, male: 1 , genderless: 2 }
  enum dating_type: { virtual: 0, safely_distanced_real_life: 1 }
  enum marital_status: { individual: 0, couple: 1 }
  enum dating_reason: { dating: 0, friendship: 1 }
end
