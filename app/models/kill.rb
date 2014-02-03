class Kill < ActiveRecord::Base
belongs_to :target, class_name: "User"
belongs_to :killer, class_name: "User"
validates :killer_id , presence: true
validates :target_id , presence: true
end
