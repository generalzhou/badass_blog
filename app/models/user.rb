class User < ActiveRecord::Base
  
      # t.string :email
      # t.string :user_name
      # t.string :first_name
      # t.string :last_name
      # t.string :password_hash
      # t.timestamps
  has_many :posts
  validates :user_name, :presence => true, :uniqueness => true
  validates :email, :presence => true



  include BCrypt

  def password
    @password ||= Password.new(self.password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(options={})
    @user = User.new(options)
    @user.password = options[:password]
    @user.save!
    @user
  end

  def self.authenticate(params)
    @user = User.find_by_email(params[:email])
    (@user && @user.password == params[:password]) ? @user : false
  end

  def full_name
    first_name + ' ' + last_name
  end
end
