class Profile < ApplicationRecord
  belongs_to :user
  # mount_uploader :image, ImageUploader
  # gender_type for gender and with_whom
  enum gender_type: { female: 'female', male: 'male' , genderless: 'genderless' }
  enum dating_type: { virtual: 'virtual', safely_distanced_real_life: 'safely distanced real life' }
  enum marital_status: { individual: 'individual', couple: 'couple' }
  enum dating_reason: { dating: 'dating', friendship: 'friendship' }

end
