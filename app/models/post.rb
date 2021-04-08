class Post < ApplicationRecord

	include Creatable
	belongs_to :user
	validates :content, presence: true
	scope :short_content, lambda {|count| where("LENGTH(content) < #{count}") }
	has_many :comments, as: :commentable
	
	after_save :after_save_method
	after_create :after_create_method
	after_commit :after_commit_method

	 after_initialize do |user|
    puts "You have initialized an object!!!!!!!!!!!!1"
  end

  after_find do |user|
    puts "You have found an object!!!!!!!!!!!1!"
  end
	

	def self.search(search)
		search ? where(["content LIKE ?","%#{search}%"]) : all
	end

	def after_save_method
		puts '-------------------after save model'
	end

	def after_create_method
		puts '-------------------after create model'
	end

	def after_commit_method
		puts '------------------after commit(create post, save post , destroy post)'
	end


	# model ke object ke through call krwate he, object mtlb single single record(not array)
	#it is an instance method, called in posts#index
	def call_method
		"abacd"
	end

	#class method on singel record , means post#show
	#kaise call krwate he- class name(Post) then method name(self_method)- Post.self_method 
	def self.self_method
		"self method is a class method "
	end
end
