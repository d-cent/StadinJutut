class Subscription < ActiveRecord::Base
  
  # validations
  validates :terms, presence: true
  validates :email, presence: true
  
  # callbacks
  after_create :generate_hashed_id

  def to_param
    self.hashed_id
  end
  
  def self.find_securely(supposed_hash)
    where(hashed_id: supposed_hash).first if supposed_hash.present?
  end
  
  def term_list
    terms.join(', ')
  end
  
  def term_list=(terms)
    self.terms = terms.split(',').map(&:strip)
  end

private
  
  def generate_hashed_id
    self.update_attributes(hashed_id: Digest::SHA1.hexdigest("--#{ StadinJutut::Application.config.secret_key_base }--#{self.id}--"))
  end
end