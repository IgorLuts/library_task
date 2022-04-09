require_relative 'library'
require_relative 'module'

# Класс создающий новых читателей
class Reader
  include Name

  attr_reader :email, :city, :street, :house

  # Переменная 'email читателя' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def email=(email)
    raise 'Error, email must be a string, required and not empty' if email.nil? || !email.is_a?(String) || email == ''

    @email = email
  end

  # Переменная 'Город читателя' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def city=(city)
    raise 'Error, city must be a string, required and not empty' if city.nil? || !city.is_a?(String) || city == ''

    @city = city
  end

  # Переменная 'Улица читателя' (должна быть обязательной, строкой, иметь проверку на пустоту)
  def street=(street)
    if street.nil? || !street.is_a?(String) || street == ''
      raise 'Error, street must be a string, required and not empty'
    end

    @street = street
  end

  # Переменная 'Номер дома читателя' (должна быть обязательной, числом, иметь проверку на пустоту)
  def house=(house)
    raise 'Error, house must be an integer, not empty and > 0' if !house.is_a?(Numeric) || house.nil? || house <= 0

    @house = house
  end

  # Метод инициализации экземпляра класса Reader + автоматическая проверка читателя
  def initialize(name, email, city, street, house)
    self.name = name
    self.email = email
    self.city = city
    self.street = street
    self.house = house
  end

  # Метод проверяющий чтобы читателя которого заносят в библиотеку не занесли повторно
  def check_reader_in_readers(readers)
    count = 0
    readers.each do |reader|
      count += 1 if reader.name == name || reader.email == email
    end
    raise 'Sorry, a reader with the same name or email already exists' if [1, 2].include?(count)
  end

  # Метод добавления нового читателя в библиотеку
  def reader_to_arrow_readers(readers)
    check_reader_in_readers(readers)
    readers << self
  end
end
