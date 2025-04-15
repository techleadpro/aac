# aac - 
This application dashboard is to provide the service api to register truck drivers and corresponding truck driver ID or documents. The platform is developed as a microservice so both the frontend and backend can run independently(not a monolith). The backend is hosted live( via render) and the frontend can be setup independently to interact with backend api. The application runs a postgresql database to store the data.

![car-interface](https://github.com/user-attachments/assets/5678f527-1553-4433-b54b-e277f8a9198d)


# car dashboard
![car-dash1](https://github.com/user-attachments/assets/1223d15b-c8ca-43c5-90a2-c17ca4dd3c09)


# registration form
![car-registration](https://github.com/user-attachments/assets/4fdf7189-51ee-4665-8ffb-6151538c77a1)




# Instructions on how to run
You can run the following to setup up the frontend service( since the backend is already live and set to interact with the frontend).

> cd frontend

> npm install

> npm run dev

Then go to browser http://localhost:3000/ or assigned node 

Theses commands will run the service and can interact with the application.


# Frontend

The frontend is developed in nuxtjs and vuejs. It is powered by nodejs.



# Backend specific details

> bundle config set force_ruby_platform true

> bundle install

> rails db:create

> rails db:migrate

> rails server

ruby version - ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [x86_64-linux]

rails - Rails 8.0.2
