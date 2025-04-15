# aac - 
This application dashboard is to provide the service api to register truck drivers and corresponding truck driver ID or documents. The platform is developed as a microservice so both the frontend and backend can run independently(not a monolith). The backend is hosted live( via render) and the frontend can be setup independently to interact with backend api. The application runs a postgresql database to store the data.

# Instructions on how to run
You can run the following to setup up the frontend service( since the backend is already live and set to interact with the frontend).

> cd frontend

> npm install

> npm run dev 

Theses commands will run the service and can interact with the application.



# Backend specific details

> bundle config set force_ruby_platform true

> bundle install

> rails db:create

> rails db:migrate

> rails server

ruby version - ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [x86_64-linux]

rails - Rails 8.0.2
