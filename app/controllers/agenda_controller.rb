class AgendaController < ApplicationController
  def index
  	@contactos=Contact.all
  end
end
