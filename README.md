# iOS App: NewsAPP
an app in which you can see the latest news and also has a list of users which allows you to see their location

##MVC design pattern

In this case I decided to implement an MVC pattern because the app did not have too much complexity in itself and with this pattern I could develop it easily.

##APIs used

I also decided to use 2 different APIs, one of these was the news API in which I used the https://newsapi.org API within these I used a format for the featured news that is displayed when the app is opened (https: //newsapi.org/v2/top-headlines?country=us&apiKey=) and also use a different format to implement the search bar (https://newsapi.org/v2/everything?from=2024-07-06&to=2024-07-07&sortBy=popularity&apiKey=&q=)

In the case of users, I decided to use the following API https://randomuser.me/api/?results=50 which generates users randomly with various data, among these would be the full name, location, coordinates, image and many more. The only problem I found with this API is that since the coordinates are random, some users show strange positions.

##UI Design

For the design of the UI I decided to do it in 2 different ways, in the case of the Table View that is responsible for showing the news along with the Search Bar I programmed them and in the case of the Table View with the list of users I did it with the StoryBoard in which I also decided to implement a TabBar to be able to switch between the news screen and the users screen

# iOS App: NewsAPP
una app en la cual se pueden ver las ultimas noticias y tambien tiene una lista de usuarios la cual te permite ver la ubicacion de estos mismos

##Patron de diseño MVC

En este caso decidi implementar un patron MVC debido a que la app no tenia demasiada complejidad en si y con este patron podria desarrollarla tranquilamente

##API utilizadas

Tambien decidi utilizar 2 API diferentes, una de estas fue la de las noticias en la cual utilice la API de https://newsapi.org dentro de estas utilice un formato para las noticias destacadas que se muestran cuando se abre la app (https://newsapi.org/v2/top-headlines?country=us&apiKey=) y tambien utilice un formato diferente para implementar la barra de busqueda (https://newsapi.org/v2/everything?from=2024-07-06&to=2024-07-07&sortBy=popularity&apiKey=&q=)

Para el caso de los usuarios decidi utilizar la siguiente API https://randomuser.me/api/?results=50 la cual genera usuarios de forma random con varios datos, entre estos estarian el nombre completo, la localidad, las coordenadas, la imagen y muchos mas.
El unico problema que encontre con esta API es que al ser coordenadas random algunos usuarios muestran posiciones raras

##Diseño de la UI

Para el diseño de la UI decidi hacerlo de 2 formas diferentes, en el caso de la Table View que se encarga de mostrar las noticias junto a las Search Bar las programe y en el caso de la Table View con la lista de usuarios lo hice con el StoryBoard en el cual tambien decidi implementar una TabBar para poder cambiar entre la pantalla de noticias y la de usuarios
