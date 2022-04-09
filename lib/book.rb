require_relative 'library'
require_relative 'author'

# Класс создающий новые книги
class Book
  attr_accessor :author
  attr_reader :title

  # Переменная 'Заглавие книги' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def title=(title)
    raise 'Error, name must be required and not empty' if title.nil? || title.is_a?(Numeric) || title == ''

    @title = title
  end

  # Переменная 'Имя автора' (должна быть обязательной, строкой, не пустой)
  def author_name=(author_name)
    if author_name.nil? || author_name.is_a?(Numeric) || author_name == ''
      raise 'Error, name must be required and not empty'
    end

    @author_name = author_name
  end

  # Инициализация нового экземпляра класса
  def initialize(title, author_name, authors)
    self.title = title
    self.author_name = author_name
    new_author = check_author_name(author_name, authors)
    @author = new_author
  end

  # Метод добавления новой книги в библиотеку(в массив books)
  def book_to_arrow_books(books)
    books << self
  end

  # Метод осуществляющий проверку существования автора в библиотеке(по имени автора)
  def check_author_name(author_name, authors)
    authors.each do |author|
      return author if author.name == author_name
    end
    raise 'Please, add a new author to the library first'
  end
end
