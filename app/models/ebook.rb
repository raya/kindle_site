# == Schema Information
#
# Table name: ebooks
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ebook < ActiveRecord::Base
  attr_accessible :location, :status
end
