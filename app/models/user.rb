class User < ActiveRecord::Base
belongs_to :hall
belongs_to :kill
belongs_to :group
has_many :groups_users
has_many :messages, as: :target
belongs_to :target , class_name: "User" 
end
