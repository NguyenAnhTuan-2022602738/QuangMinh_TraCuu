# Product Lookup System

## Overview
The Product Lookup System is a web application designed to allow users to search for products by their codes and view detailed information, including prices tailored to different customer types. The application is built using Node.js for the backend, React.js for the frontend, and MongoDB for data storage. 

## Features
- **Product Search**: Users can search for products using their unique codes.
- **Customer Type Filtering**: Users can select their customer type to view prices that are relevant to them.
- **Detailed Product Information**: Each product has a detailed view that displays all relevant information.
- **Responsive Design**: The application is designed to be user-friendly and responsive across devices.

## Technologies Used
- **Frontend**: React.js, CSS
- **Backend**: Node.js, Express.js
- **Database**: MongoDB
- **Authentication**: JWT (JSON Web Tokens)

## Project Structure
The project is divided into two main directories: `client` for the frontend and `server` for the backend.

### Client
- **public**: Contains static files like `index.html` and `favicon.ico`.
- **src**: Contains all React components, services, context, styles, and utility functions.

### Server
- **src**: Contains controllers, models, routes, middleware, configuration, and utility functions for the backend.

## Installation
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the client directory and install dependencies:
   ```
   cd client
   npm install
   ```
3. Navigate to the server directory and install dependencies:
   ```
   cd ../server
   npm install
   ```
4. Set up the MongoDB database and update the `.env` file in the server directory with your database connection string.
5. Start the server:
   ```
   npm start
   ```
6. In a separate terminal, navigate to the client directory and start the React application:
   ```
   npm start
   ```

## Usage
- Open your browser and navigate to `http://localhost:3000` to access the application.
- Use the search bar to look up products by their codes.
- Select your customer type to filter the displayed prices accordingly.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.

## License
This project is licensed under the MIT License.