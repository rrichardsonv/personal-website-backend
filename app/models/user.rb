class User < ApplicationRecord
  has_secure_password
  before_save :format_social_media

  has_many :entries, as: :authorable
  has_many :projects, through: :entries

  def format_social_media
    self.github_format
    self.linkedin_format
    self.twitter_format
  end

  def github_format
    gh = self.github
    unless !!gh =~ /^https:\/\/.*/ && gh =~ /.*github.com.*\//
      self.github = ["https:/","github.com", gh].join("/")
    end
  end

  def linkedin_format
    li = self.linkedin
    unless !!li =~ /^https:\/\/.*/ && li =~ /.*linkedin.com\/in.*\//
      self.linkedin = ["https:/","linkedin.com","in", li].join("/")
    end
  end

  def twitter_format
    tw = self.twitter
    unless !!tw =~ /^https:\/\/.*/ && tw =~ /.*twitter.com.*\//
      self.twitter = ["https:/","twitter.com", tw].join("/")
    end
  end
  
end
