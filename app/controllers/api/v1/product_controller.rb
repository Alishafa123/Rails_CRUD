class Api::V1::ProductController < ApplicationController
  def index
    @products=Product.all
    render json: @products ,status: 200
  end

  def show
    @product=Product.find_by(id: params[:id])
    if @product
      render json: @product ,status: 200
    else
      render json: {error: "Not Found"}, status: 404
    end
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price])
    if @product.save
      render json: @product, status: 201
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def new
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product
      @product.destroy
      render json: { message: "Product deleted successfully" }, status: 200
    else
      render json: { error: "Product not found" }, status: 404
    end
  end

  def update
  end
end
