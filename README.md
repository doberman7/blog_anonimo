# blog_anonimo

Blog Anónimo

Vamos a crear una página simple con un blog. Esta será nuestra primera relación de muchos a muchos dentro del contexto de Sinatra. Más tarde, vamos a integrar la autenticación de usuarios.

Haz el reto Conociendo Sinatra primero que lo tuviste que hacer días anteriores, si no te sientes cómodo con el flujo de una aplicación web o cómo las formas envían datos al servidor, esto es usar puts en tus controladores para imprimir en tu servidor la información necesaria para saber de dónde a dónde viajan los datos.

Tendremos dos modelos principales: posts y tags. Un post puede tener muchos tags y un tag puede pertenecer a muchos posts.

Objetivos Académicos
Usar asociaciones de muchos a mucho en ActiveRecord.
Definir las rutas del controlador en varios archivos.
Validaciones en ActiveRecord.
Actividades
Descargar Archivos

Controladores y Rutas
Piensa en los controladores y las rutas necesarias. Considera hacer tres controladores, cada uno en su propio archivo:

app/controllers/index.rb
app/controllers/posts.rb
app/controllers/tags.rb
El controlador index sólo tendrá la ruta que muestra la página principal. Todas las rutas relacionadas con Post irán en el controlador posts y todas las rutas relacionadas con Tag irán en el controlador tags.

Posts tiene las siguientes operaciones:

Mostrar todos los posts.
Mostrar un post determinado.
Crear un post nuevo.
Editar un post existente.
Eliminar un post existente.
Tags tiene las siguientes operaciones:

Mostrar todos los posts con cierto Tag.
Las Tags serán creadas al momento que se creen los Posts.

Modelos y Validaciones
Crea todos los modelos y las migraciones necesarias. Debes tener tres modelos - ¿cuáles son?

Añade las validaciones necesarias para tus modelos. Lee la guía de Rails para validaciones de ActiveRecord como referencia.

Por ejemplo, si tu modelo Post tiene los campos: body y title, es probable que no quieren permitir que un Post que no tiene body o title se guarde en la base de datos. Esto significa añadir restricciones NOT NULL a las migraciones y las siguientes validaciones a tu modelo de ActiveRecord:

class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true
end
Vas a tener otros campos y validaciones. ¿Qué campos quieres que tenga tu blog? Autor?

Diseña páginas simples y formas
Diseña páginas simples y formas para implementar la funcionalidad descrita arriba. No te preocupes por los estilos. Estructura bien el código HTML para que sea más fácil darle estilo después.

Tus forms para crear y actualizar Posts deben permitir introducir Tags. Piensa en cómo hacer fácil para el usuario introducir Tags. Sería muy tedioso tener que crear los Tags antes para poder usarlos al crear un Post. También si se usa un Tag que ya existe, no quieres que se cree un nuevo registro en la tabla tags sino reutilizar el Tag existente.

Una forma de hacerlo, es permitir introducir los Tags de la siguiente manera:

<label for="post_tags">Tags:</label>
<input id="post_tags" name="post[tags]" value="tag1, tag2, otro tag, cuarto tag">
lo que muestra como:

Tags:

Tags: 
tag1, tag2, otro tag, cuarto tag

Termina la funcionalidad básica de todas las rutas. Tu programa debe permitir listar, mostrar, crear, actualizar y eliminar Posts. También debe permitir ver todos los Posts que tienen cierto Tag en una url como la siguiente:

http://localhost:9393/tag/manzana
Errores
Usando valid?, invalid? y los métodos de errores, asegúrete de que estás manejando correctamente los casos de error. No tiene que ser perfecto, pero un buen manejo de errores significa:

Cuando un usuario comete un error o rompe alguna regla, se le muestra un mensaje.
Al usuario se le presenta la oportunidad de corregir el error, si es posible.
Al usuario se da la mayor orientación posible sobre que tiene que hacer para corregir el error.
Estilo! Estilo! Estilo!
Arregla el diseño de las páginas para darle una mejor apariencia a tu blog. Si tienes tiempo, trata de hacer algo que estés orgulloso de ver utilizando Bootstrap y jQuery.

