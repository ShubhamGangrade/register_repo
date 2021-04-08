module Creatable
  extend ActiveSupport::Concern

  def created_time
  	created_at
  end
end
