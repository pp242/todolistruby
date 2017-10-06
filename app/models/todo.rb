class Todo < ApplicationRecord
	belongs_to :user


	validates :title, :body, presence: true

	validates :title, length: {minimum: 4, maximum: 200, message: "name too short/long (4/200)"} 

    validates :title, uniqueness: true 




end
