class Punchcard < ActiveRecord::Base
  attr_accessible :timein, :timeout, :client
end
