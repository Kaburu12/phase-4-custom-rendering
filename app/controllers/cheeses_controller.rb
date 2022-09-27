class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses
    # render json: cheeses , only:[:id, :name, :price]
    # render json: cheeses , except:[:created_at, :updated_at]
    render json: cheeses , except:[:created_at, :updated_at], methods:[:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    #custome render message
    if cheese
    render json: cheese,except:[:created_at, :updated_at]
    else
      render json: {error: "Cheese not found"}
    end
  end

end
