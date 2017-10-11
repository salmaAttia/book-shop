class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]  
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:destroy]
  # GET /books
  # GET /books.json
  def index
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 3)
    else
      @books = Book.paginate(page: params[:page], per_page: 3)
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.deleted = false
    if @book.save    
      flash[:success] = "Book was successfully created"   
      redirect_to books_path   
      else
        flash[:danger] = "Book cannot be created"     
        redirect_to books_path    
      end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      flash[:success] = "BOOK was successfully updated"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if @book.orderitems.present?
      @book.deleted = true
      @cartitems = @book.cartitems
      @cartitems.delete_all
      @book.save
    else  
      @book.destroy
    end 
    flash[:danger] = "Book was successfully deleted"
     redirect_to books_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
      @cartitems = @book.cartitems
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :description, :currentPrice, :avatar, :avamount)
    end


end
