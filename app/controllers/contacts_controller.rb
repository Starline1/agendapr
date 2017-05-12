class ContactsController < ApplicationController

  before_action :set_contact, except: [:index,:new, :create, :admin]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  	@contactos=Contact.all
  end
  
  def new
  	@titulo="Nuevo contacto"
  	@contact=Contact.new  	
  end

  def edit
  end

  def admin
   @contactos=Contact.all
  end

  def create
  	  @contact=Contact.new(contacts_params)
  	  if @contact.save
          redirect_to :controller=>"contacts", :action=>"index"
  	  else
          render :new
  	  end
  end
  
   def destroy
      @contact.destroy #Elimina objto bd
      redirect_to contacts_path
    end

  def update

     if @contact.update(contacts_params)
         redirect_to :controller=>"contacts", :action=>"index"
      else
         render :edit
      end
  end

  private
   def contacts_params
        params.require(:contact).permit(:nombre,:telefono,:direccion,:email)
   end

   def set_contact
      @contact=Contact.find(params[:id])
   end   


end
