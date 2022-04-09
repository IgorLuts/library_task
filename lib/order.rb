require_relative 'reader'
require_relative 'book'
require_relative 'library'
require 'date'

# Класс создающий новые заказы на книги от читателей
class Order
  attr_accessor :book, :reader
  attr_reader :date

  # Переменная 'Название книги' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def book_title=(book_title)
    if book_title.nil? || !book_title.is_a?(String) || book_title == ''
      raise 'Error, book_title must be a string, required and not empty'
    end

    @book_title = book_title
  end

  # Переменная 'Имя читателя' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def reader_name=(reader_name)
    if reader_name.nil? || !reader_name.is_a?(String) || reader_name == ''
      raise 'Error, reader_name must be a string, required and not empty'
    end

    @reader_name = reader_name
  end

  # Переменная инстанса класса Book

  # Переменная инстанса класса Reader

  # Переменная 'Дата' (может задаваться с помощью класса Time или же строкой в формате "2022, 10, 3")
  def date=(date)
    raise 'please enter an instance of the DateTime class' unless date.instance_of?(DateTime)

    @date = date
  end

  # Инициализация нового экземпляра класса Orders
  def initialize(book_title, reader_name, books, readers, date = DateTime.now)
    self.book_title = book_title
    self.reader_name = reader_name
    self.date = date
    new_book = check_book(books)
    self.book = new_book
    new_reader = check_reader(readers)
    self.reader = new_reader
  end

  # Метод добавления нового ордера в библиотеку
  def order_to_arrow_orders(orders)
    orders << self
  end

  # Метод проверки существования заказанной книги в библиотеке
  def check_book(books)
    books.each do |book|
      return book if book.title == @book_title
    end
    raise 'Please, add a new book to the library first'
  end

  # Проверка существования читателя в библиотеке
  def check_reader(readers)
    readers.each do |reader|
      return reader if reader.name == @reader_name
    end
    raise 'Please, add a new reader to the library first'
  end
end
