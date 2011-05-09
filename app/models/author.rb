class Author < User
  has_many :articles

  def author?
    true
  end
end
