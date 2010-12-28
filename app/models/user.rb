class User < ActiveRecord::Base

has_attached_file :avatar, :styles => {:thumb=> '50x'}
attr_accessible :avatar 
has_attached_file :file, :styles => {:thumb => '50x'}
attr_accessible :file

end
