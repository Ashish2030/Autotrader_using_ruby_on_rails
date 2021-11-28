class OldsController < ApplicationController
  before_action :set_old, only: %i[ show edit update destroy ]

  # GET /olds or /olds.json
  def index
    @olds = Old.all
  end

  # GET /olds/1 or /olds/1.json
  def show
  end

  # GET /olds/new
  def new
    @old = Old.new
  end

  # GET /olds/1/edit
  def edit
  end

  # POST /olds or /olds.json
  def create
    @old = Old.new(old_params)

    respond_to do |format|
      if @old.save
        format.html { redirect_to @old, notice: "Old was successfully created." }
        format.json { render :show, status: :created, location: @old }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @old.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /olds/1 or /olds/1.json
  def update
    respond_to do |format|
      if @old.update(old_params)
        format.html { redirect_to @old, notice: "Old was successfully updated." }
        format.json { render :show, status: :ok, location: @old }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @old.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /olds/1 or /olds/1.json
  def destroy
    @old.destroy
    respond_to do |format|
      format.html { redirect_to olds_url, notice: "Old was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_old
      @old = Old.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def old_params
      params.require(:old).permit(:name, :company, :price, :modal, :seat, :owner, :desc,:image)
    end
end
