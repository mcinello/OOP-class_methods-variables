class Book

@@on_shelf =[] #collection of books available to lend out
@@on_loan =[] #books currently being borrowed

  def self.due_date

  end


  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end


  def borrow

  end


  def return_to_library

  end

# #true if book borrowed, false otherwise
#   def lent_out?
#     if @title.borrowed
#       puts "Sorry, it's out!"
#     else
#       puts "We got it!"
#   end

#CLASS METHODS ---------------------------------------------------------------

#how new books are added to library @@on_shelf
  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

#
#   def self.current_due_date
#
#   end
#
#
#   def self.overdue_books
#
#   end
#
# #return a random book
#   def self.browse
#     random = @@onshelf.sample
#     return random
#   end
#
#
  def self.available
    return @@on_shelf
  end
#
#
#   def self.borrowed
#     return @@on_loan
#   end



end

#OUTPUT
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")

puts Book.available.inspect
