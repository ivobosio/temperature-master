class String
  def to_snake_case
    self.downcase.gsub(' ', '_')
  end
end