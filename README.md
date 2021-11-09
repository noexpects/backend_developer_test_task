# Python Test Task

#### General Requirements:
* Use the latest version of Django.
* Follow the rules of PEP8.
* Display errors next to the form fields.
* Use PostgreSQL as the database engine.
* Use ‘base.html’ for all of the project’s templates.
* You should update the ‘Requirements’ file whenever having added a dependency. You can also update any other version of this file if you think that the new version would be better than the used one. 
* Use English as the main language for all templates, string constants and comments. 
* When developing, try to avoid duplicating queries to the database. Make sure to optimize the code (with Django Debug Toolbar or any other tool, this choice is on you). 
* Use Django migrations for all changes in fields and models. 
* Use class-based views for all views on the website. If you think that using a function-based view in a particular case would be better, please do but add an explanation why in the comments. 
* Create fixtures or commands for data generation.

#### Task Description:
* Finish provided unit tests and add as many of them as you find necessary. 
* Update the field “slug” of the Product model so that it’s unique. 
* Add an image field to the Product model.
* Implement a page that shows a list of all categories with a number of products in each. The title must be a link leading to the page with product and category details. 
* Implement a page that would show a list of all products in a given category with pagination. Display a title, a price, a small thumbnail and the number of likes for each product. Use the category slug in URL. 
* Implement a ‘Product Details’ page. Display each product’s title, image, price, description and other basic info. 
* Add the ability to like products, save either the account of the person that has liked something or their IP address (for unauthorized users). Allow only one like per user/IP. Do not keep IP for authenticated users.
* Add the ability to comment products on their respective pages and display all recent comments (for the span of last 24 hours). The comment length should be limited to 500 symbols. Authorization should not be required, comments must be flat - ,no replies needed. 
* Add all models to the admin interface and make sure that the ‘view on site’ button works properly.

