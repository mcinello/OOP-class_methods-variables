class Book

@@on_shelf =[] #collection of books available to lend out
@@on_loan =[] #books currently being borrowed


  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def due_date
    @due_date
  end

  def due_date(reset)
    @due_date = reset
  end

  def borrow
    if self.lent_out? == true
      return false
    else
      Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
      return true
    end
  end


  # def return_to_library
  #
  # end

# #true if book borrowed, false otherwise
  def lent_out?
    if @@on_shelf
      return false
    else
      true
    end
  end

#CLASS METHODS ---------------------------------------------------------------

#how new books are added to library @@on_shelf
  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

#
  def self.current_due_date
    due_date = Time.now + 1.814e+6
  end
#
#   def self.overdue_books
#
#   end
#
# #return a random book
  def self.browse
    random = @@on_shelf.sample
    return random
  end
#
#
  def self.available
    return @@on_shelf
  end
#
#
  def self.borrowed
    return @@on_loan
  end



end

#OUTPUT
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

# puts Book.browse.inspect
# puts Book.browse.inspect
# puts Book.browse.inspect

puts Book.available.inspect
puts Book.borrowed.inspect

puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts Book.available.inspect
