# Общий модуль для классов author и reader
module Name
  attr_reader :name

  def name=(name)
    raise 'Error, name must be a string, required and not empty' if name.nil? || !name.is_a?(String) || name == ''

    @name = name
  end
end
