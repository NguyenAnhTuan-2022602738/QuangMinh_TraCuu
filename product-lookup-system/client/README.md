# Product Lookup System Client

## Overview
The Product Lookup System is a web application designed to allow users to search for products by their codes and view detailed pricing information based on different customer types. The application is built using React.js for the frontend, Node.js for the backend, and MongoDB for data storage. This README provides an overview of the client-side application, including setup instructions, features, and usage.

## Features
- **Product Search**: Users can search for products using their unique codes.
- **Product Details**: Detailed information about each product is displayed, including pricing.
- **Customer Type Selection**: Users can select their customer type to view tailored pricing information.
- **Responsive Design**: The application is designed to be responsive and user-friendly.

## Getting Started

### Prerequisites
- Node.js (version 14 or higher)
- npm (Node Package Manager)

### Installation
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the client directory:
   ```
   cd product-lookup-system/client
   ```
3. Install the dependencies:
   ```
   npm install
   ```

### Running the Application
To start the development server, run:
```
npm start
```
This will start the application on `http://localhost:3000`.

### Building for Production
To create a production build of the application, run:
```
npm run build
```
The build artifacts will be stored in the `build` directory.

## Folder Structure
- **public/**: Contains static files such as `index.html` and `favicon.ico`.
- **src/**: Contains the source code for the application.
  - **components/**: React components for the application.
  - **services/**: Functions for API interactions and authentication.
  - **context/**: Context API for managing global state.
  - **styles/**: CSS files for styling the application.
  - **utils/**: Utility functions for data formatting.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.