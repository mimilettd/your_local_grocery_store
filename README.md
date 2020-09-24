## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
```
Ruby 2.6.2
```

### Installing
Clone the app and change into the `your_local_grocery_store` directory:

```
$ git clone https://github.com/mimilettd/your_local_grocery_store.git
$ cd your_local_grocery_store
```

### Install the dependencies:

```
bundle install
```

Run the following commands in your terminal to prepare and start the server:
```
$ rake db:create db:migrate db:backfill_products db:backfill_sales
$ rails s
```

To view the application, visit http://localhost:3000/checkouts/new
