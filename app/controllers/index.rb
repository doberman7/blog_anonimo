# El controlador index sólo tendrá la ruta que muestra la página principal. 
get '/' do
  # La siguiente linea hace render de la vista
  # que esta en app/views/index.erb
  erb :index
end
