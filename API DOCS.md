# Car Dealership API Documentation

Welcome to the Car Dealership API. This API provides various endpoints for managing customer data, employee details, turnover, pending bookings, and more. Please follow the documentation below to interact with the API.

## Base URL

```plaintext
http://localhost:8081
```

## Endpoints

### Admin

#### Admin Login

- **URL:** `/admin`
- **Method:** `POST`
- **Description:** Authenticate an admin user.
- **Request Body:**
  ```json
  {
    "email": "admin@example.com",
    "password": "admin123"
  }
  ```
- **Response:**
  - `200 OK` - Successful login
  - `401 Unauthorized` - Invalid credentials
  - `500 Internal Server Error` - Server error

### Customer

#### Get Customer Data

- **URL:** `/customer`
- **Method:** `GET`
- **Description:** Retrieve information about all customers.
- **Response:**
  - `200 OK` - List of customer data
  - `404 Not Found` - No customers found
  - `500 Internal Server Error` - Server error

#### Create Customer

- **URL:** `/customer`
- **Method:** `POST`
- **Description:** Create a new customer.
- **Request Body:**
  ```json
  {
    "name": "John Doe",
    "phone": "+123456789",
    "address": "123 Main St",
    "licenceNumber": "ABCD123",
    "password": "securePassword"
  }
  ```
- **Response:**
  - `201 Created` - Customer added successfully
  - `400 Bad Request` - Missing required fields
  - `500 Internal Server Error` - Server error

#### Delete Customer

- **URL:** `/customer/:id`
- **Method:** `DELETE`
- **Description:** Delete a customer by ID.
- **Response:**
  - `200 OK` - Customer deleted successfully
  - `404 Not Found` - Customer not found
  - `500 Internal Server Error` - Server error

#### Edit Customer

- **URL:** `/customer/:id`
- **Method:** `PUT`
- **Description:** Update customer details by ID.
- **Request Body:** Provide fields to update.
  ```json
  {
    "name": "Updated Name",
    "address": "Updated Address"
  }
  ```
- **Response:**
  - `200 OK` - Customer details updated successfully
  - `400 Bad Request` - No valid fields to update
  - `500 Internal Server Error` - Server error

### Employee

#### Get Employee Data

- **URL:** `/employee`
- **Method:** `GET`
- **Description:** Retrieve information about all employees.
- **Response:**
  - `200 OK` - List of employee data
  - `404 Not Found` - No employees found
  - `500 Internal Server Error` - Server error

#### Add New Employee

- **URL:** `/employee`
- **Method:** `POST`
- **Description:** Add a new employee.
- **Request Body:**
  ```json
  {
    "name": "Jane Smith",
    "department": "Sales",
    "salary": 50000
  }
  ```
- **Response:**
  - `201 Created` - Employee added successfully
  - `400 Bad Request` - Incomplete data
  - `500 Internal Server Error` - Server error

#### Delete Employee

- **URL:** `/employee/:id`
- **Method:** `DELETE`
- **Description:** Delete an employee by ID.
- **Response:**
  - `200 OK` - Employee deleted successfully
  - `404 Not Found` - Employee not found
  - `500 Internal Server Error` - Server error

#### Edit Employee

- **URL:** `/employee/:id`
- **Method:** `PUT`
- **Description:** Update employee details by ID.
- **Request Body:** Provide fields to update.
  ```json
  {
    "name": "Updated Employee",
    "salary": 60000
  }
  ```
- **Response:**
  - `200 OK` - Employee details updated successfully
  - `400 Bad Request` - No valid fields to update
  - `500 Internal Server Error` - Server error

#### Total Number of Employees

- **URL:** `/totalEmployee`
- **Method:** `GET`
- **Description:** Get the total number of employees.
- **Response:**
  - `200 OK` - Number of employees
  - `404 Not Found` - No employees found
  - `500 Internal Server Error` - Server error

### TurnOver

#### TurnOver Query

- **URL:** `/turnOver`
- **Method:** `GET`
- **Description:** Get the total turnover from car sales.
- **Response:**
  - `200 OK` - Total turnover
  - `404 Not Found` - No turnover found
  - `500 Internal Server Error` - Server error

### Pending Bookings

#### Pending Bookings Query

- **URL:** `/pendingBookings`
- **Method:** `GET`
- **Description:** Get the count of pending bookings.
- **Response:**
  - `200 OK` - Number of pending bookings
  - `404 Not Found` - No pending bookings found
  - `500 Internal Server Error` - Server error

### Click Delivered

#### Click Delivered Query

- **URL:** `/booking/:id`
- \*\*

Method:\*\* `PUT`

- **Description:** Mark a booking as delivered.
- **Response:**
  - `200 OK` - Booking status updated successfully
  - `500 Internal Server Error` - Server error

### Displaying Service

#### Displaying Service Query

- **URL:** `/service`
- **Method:** `GET`
- **Description:** Get information about available services.
- **Response:**
  - `200 OK` - List of services
  - `404 Not Found` - No services found
  - `500 Internal Server Error` - Server error

#### Cars Details

- **URL:** `/car`
- **Method:** `GET`
- **Description:** Get details of all cars in the inventory.
- **Response:**
  - `200 OK` - List of cars
  - `404 Not Found` - No cars found
  - `500 Internal Server Error` - Server error

---

### Adding New Car

#### Adding New Car Query

- **URL:** `/car`
- **Method:** `POST`
- **Description:** Add a new car to the inventory.
- **Request Body:**
  ```json
  {
    "chassisno": "ABC123",
    "engineno": "XYZ456",
    "cartype": "Sedan",
    "modelname": "Example Model",
    "cardescription": "New Car Description",
    "color": "Blue",
    "price": 30000,
    "stock": 10
  }
  ```
- **Response:**
  - `200 OK` - Car added successfully
  - `400 Bad Request` - Missing required fields or image files
  - `500 Internal Server Error` - Server error

### Edit Car Details

#### Edit Car Details Query

- **URL:** `/car/:id`
- **Method:** `PUT`
- **Description:** Update car details by ID.
- **Request Body:** Provide fields to update.
  ```json
  {
    "modelname": "Updated Model",
    "price": 35000,
    "stock": 15
  }
  ```
- **Response:**
  - `200 OK` - Car details updated successfully
  - `400 Bad Request` - No valid fields to update
  - `500 Internal Server Error` - Server error

Get Car by ID
Request
URL: /car/:id
Method: GET
Path Parameters
id (integer): The unique identifier of the car.
Response
Success Response:

Status Code: 200 OK
Content: JSON object containing car details.
Error Responses:

Status Code: 404 Not Found

Content: JSON object with an error message.
Status Code: 500 Internal Server Error

Content: JSON object with an error message.

### Delete Car

#### Delete Car Query

- **URL:** `/car/:id`
- **Method:** `DELETE`
- **Description:** Delete a car by ID.
- **Response:**
  - `200 OK` - Car deleted successfully
  - `404 Not Found` - Car not found
  - `500 Internal Server Error` - Server error

### User

#### User Signup

- **URL:** `/usersignup`
- **Method:** `POST`
- **Description:** Create a new user account.
- **Request Body:**
  ```json
  {
    "name": "User Name",
    "phone": "+987654321",
    "address": "User Address",
    "licenceNumber": "WXYZ789",
    "password": "userPassword"
  }
  ```
- **Response:**
  - `200 OK` - User account created successfully
  - `400 Bad Request` - Missing required fields
  - `500 Internal Server Error` - Server error

#### User Login

- **URL:** `/userlogin`
- **Method:** `POST`
- **Description:** Authenticate a user.
- **Request Body:**
  ```json
  {
    "phone": "+987654321",
    "password": "userPassword"
  }
  ```
- **Response:**
  - `200 OK` - Successful login
  - `401 Unauthorized` - Invalid credentials
  - `500 Internal Server Error` - Server error

### Book a Service

#### Book a Service Query

- **URL:** `/service`
- **Method:** `POST`
- **Description:** Book a service for a customer.
- **Request Body:**
  ```json
  {
    "regNo": "AB123CD",
    "name": "Customer Name",
    "phone": "+123456789",
    "serviceType": "Oil Change",
    "currentDate": "2024-03-01"
  }
  ```
- **Response:**
  - `200 OK` - Service booked successfully
  - `400 Bad Request` - Missing required fields
  - `500 Internal Server Error` - Server error

### Common

Please note that this documentation provides basic information. Additional details, error handling, and input validation can be implemented based on specific use cases.
