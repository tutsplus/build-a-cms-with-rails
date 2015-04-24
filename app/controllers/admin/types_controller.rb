module Admin
  class TypesController < ApplicationController
    def index
      @types = Type.all
    end

    def new
      @type = Type.new
      3.times { @type.field_definitions.build }
    end

    def create
      @type = Type.new type_params
      if @type.save
        redirect_to admin_types_path, notice: "Type created."
      else
        render :new
      end
    end

    def update
      @type = Type.find params[:id]
      if @type.update_attributes type_params
        redirect_to admin_types_path, notice: "Type updated."
      else
        render :edit
      end
    end

    def edit
      @type = Type.find params[:id]
      3.times { @type.field_definitions.build }
    end

    def destroy
      @type = type.find params[:id]
      if @type.destroy
        redirect_to admin_types_path, notice: "Type deleted."
      else
        redirect_to admin_types_path, alert: "Type was not deleted."
      end
    end

    protected

    def type_params
      params.require(:type).permit(:name, :field_definitions_attributes => [ :key, :id] )
    end
  end
end
