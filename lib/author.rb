require_relative 'library'
require_relative 'module'
require 'secret_pseudonym'

# Класс создающий новых авторов
class Author
  include Name
  include SecretPseudonym

  attr_accessor :biography

  # Метод инициализации экземпляра класса Author + автоматическая проверка автора
  def initialize(name, authors, biography = 'empty')
    self.name = name
    @biography = biography
    check_author(authors)
  end

  # Метод добавления нового автора в библиотеку
  def author_to_arrow_authors(authors)
    authors << self
  end

  # Метод не позволяющий добавить уже занесенного в библиотеку автора повторно(проверяет по имени автора)
  def check_author(authors)
    authors.each do |author|
      raise 'this author already exist' if author.name == @name
    end
  end
end
