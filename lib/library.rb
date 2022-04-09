require 'yaml'
require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'

# Класс выводит основные данные требуемой статистики библиотеки
class Library
  attr_accessor :authors, :books, :readers, :orders

  # При создании экземпляра класса должны создаваться массивы в которые будут добавляться экземпляры других классов
  def initialize
    self.authors = []
    self.books = []
    self.readers = []
    self.orders = []
  end

  # Метод записывающий данные из библиотеки в файл YML
  def library_save
    File.write('./library.yml', to_yaml)
  end

  # Метод получающий информацию из ранее записанной библиотеки из файла YML
  def self.library_load
    YAML.load(File.read('./library.yml'))
  end

  # Метод выводит количество уникальных читателей взявших популярную(ые) книгу(и)(количество передается в аргументе)
  def top_book_readers(count = 1)
    # Узнаем названия топ книг
    top_book_name = top_book(count).map { |item| item[0] }
    # Используем метод uniq_book_reader
    uniq_book_reader
    # Узнаем сколько уникальных читателей взяли топ книги
    result = 0
    top_book_name.each do |item|
      uniq_book_reader.each do |item1|
        result += 1 if item == item1[0]
      end
    end
    result
  end

  # Метод создает массив с элементами [имя книги, имя читателя], потом делает его(массив) уникальным по имени читателя
  def uniq_book_reader
    orders.map { |order| [order.book.title, order.reader.name] }.uniq { |item| item[1] }
  end

  # Метод который выводит самые популярные книги(количество передается в аргументе)
  def top_book(count = 1)
    top_books = Hash.new { 0 }
    orders.each { |order| top_books[order.book.title] += 1 }
    result = top_books.sort_by { |_key, value| value }.reverse
    result[0..count - 1]
  end

  # Метод который выводит читателей взявших наибольшее количество книг(количество передается в аргументе)
  def top_reader(count = 1)
    top_readers = Hash.new(0)
    orders.each { |order| top_readers[order.reader.name] += 1 }
    result = top_readers.sort_by { |_key, value| value }.reverse
    result[0..count - 1]
  end
end
