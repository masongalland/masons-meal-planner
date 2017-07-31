create table users ( 
    user_id serial primary key, 
    auth0_id integer, 
    full_name text, 
    photo text 
);

create table friends (
    f_id serial primary key,
    user_id integer references users (user_id),
    friend_id integer references users (user_id)
)

create table Recipes (
    recipe_id serial primary key,
    owner_id integer references users (user_id),
    recipe_name varchar(60),
    recipe_photo text,
    description varchar(250),
    servings int,
    prep_time int,
    meal varchar(10),
    tags text array,
    privacy_setting text
)

create table steps (
    step_id serial primary key,
    recipe_id integer references recipes (recipe_id),
    step_number int,
    step_category varchar(30),
    description varchar(300)
)

create table subscribers (
    subscription_id serial primary key,
    owner_id integer references users (user_id),
    subscriber_id integer references users (user_id),
    recipe_id integer references recipes (recipe_id) 
)

create table ingredients (
    ingredient_id serial primary key,
    recipe_id integer references recipes (recipe_id),
    ingredient_name varchar(25),
    ingredient_category varchar(30),
    amount text,
    mesurement_unit varchar(20)
)

create table tools (
    tool_id serial primary key,
    recipe_id integer references recipes (recipe_id),
    tool_name varchar(25),
    quantity varchar(30)
)

create table current_week (
    meal_id serial primary key,
    user_id integer references users (user_id),
    recipe_id integer references recipes (recipe_id),
    day_of_week varchar(25),
    servings integer
)

create table next_week (
    meal_id serial primary key,
    user_id integer references users (user_id),
    recipe_id integer references recipes (recipe_id),
    day_of_week varchar(25),
    servings integer
)

create table comments (
    comment_id serial primary key,
    user_id integer references users (user_id),
    recipe_id integer references recipes (recipe_id),
    comment_date timestamp,
    comment_text text
)

create table ratings (
    rating_id serial primary key,
    user_id integer references users (user_id),
    recipe_id integer references recipes (recipe_id),
    rating integer
)
