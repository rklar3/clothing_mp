class Product < ApplicationRecord

    mount_uploader :image, ImageUploader
    serialize :image, JSON # If you use SQLite, add this line.
    belongs_to :user, optional: true
    
    has_many :comments

    validates :title, :price, presence: true
    #validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maxmimum allowed."}
    #validates :title, length: { maximum: 140, too_long: "%{count} characters is the maxmimum allowed."}
    #validates :price, numericality: { only_integer: true }, length: {maximum: 7}

   
    TYPE = %w{ Shirts Shorts Pants Hoodie Shoes Hats Accessories Other}
    BRAND = %w{ Nike Adidas Converse UnderArmour Offwhite Supreme Lululemon Other}
    CONDITION = %w{ New Excellent Mint Used Fair Poor }
    SIZE = %w{ Small Medium Large XL 6 7 8 9 10 11 12 13 14 15 }
    GENDER = %w{ Men Female boys girls toddler}
    COLOR = %w{ Black White Red Green Blue Orange Purple Pink Grey Yellow }

    def self.search(search)
        if search
          where('title LIKE ? OR size LIKE ? OR brand LIKE ? OR gender LIKE ? OR size LIKE ? OR condition LIKE ? OR description LIKE ?', "%#{search}%","%#{search}%","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
        else
          all
        end
      end


    scope :recent, -> { order("created_at DESC")}
    



end
