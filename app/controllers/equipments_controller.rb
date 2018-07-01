class EquipmentsController< ShopifyApp::AuthenticatedController

  def create
    @equipment = Equipment.new(equipment_params)
 
    ftrs = equipment_params["features"].try(:gsub, "\r\n", ",")
    @equipment.features = ftrs
    @equipment.name.downcase!
    @equipment.save
    p @equipment
    redirect_to equipment_path(@equipment.id)
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def index
    @equipments = Equipment.all
    @products = ShopifyAPI::Product.find(:all)
        
    if params[:search]
      @equipments = Equipment.search(params[:search]).order("created_at DESC")
    else
      @equipments = Equipment.all.order("created_at DESC")
    end
  end

  def update
    @equipment = Equipment.find(params[:id])

    if @equipment.update(equipment_params)
      @equipment.features.gsub("\r\n", ",").split(",")
      @equipment.name.downcase!
      redirect_to @equipment
    else
      render 'edit'
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    redirect_to equipments_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :price, :brief_description, :features, :picture)
  end
end
