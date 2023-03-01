require 'date'
require_relative './years'

class Item
  attr_accessor :archived, :publish_date
  attr_reader :label, :author, :genre, :source

  def initialize(publish_date, archived, _id)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    (DateTime.now.year - DateTime.parse(@publish_date).year).to_f > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def author=(author)
    @author = author
    author.items << self
  end
end
