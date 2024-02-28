# API Documentation

## Customer

### Get All Customers

Retrieve information about all customers.

- **URL:** `/customer`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns an array of customer objects.
  - `404 Not Found`: No customers found.
  - `500 Internal Server Error`: Server error.

### Delete Customer

Delete a customer by ID.

- **URL:** `/customer/:id`
- **Method:** `DELETE`
- **Parameters:**
  - `id`: Customer ID.
- **Response:**
  - `200 OK`: Customer deleted successfully.
  - `404 Not Found`: Customer not found.
  - `500 Internal Server Error`: Server error.

## Employee

### Get All Employees

Retrieve information about all employees.

- **URL:** `/employee`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns an array of employee objects.
  - `404 Not Found`: No employees found.
  - `500 Internal Server Error`: Server error.

### Add New Employee

Add a new employee.

- **URL:** `/employee`
- **Method:** `POST`
- **Body Parameters:**
  - `name`: Employee name.
  - `department`: Employee department.
  - `salary`: Employee salary.
- **Response:**
  - `201 Created`: Employee added successfully.
  - `400 Bad Request`: Incomplete data.
  - `500 Internal Server Error`: Server error.

### Delete Employee

Delete an employee by ID.

- **URL:** `/employee/:id`
- **Method:** `DELETE`
- **Parameters:**
  - `id`: Employee ID.
- **Response:**
  - `200 OK`: Employee deleted successfully.
  - `404 Not Found`: Employee not found.
  - `500 Internal Server Error`: Server error.

### Edit Employee

Edit an employee's details.

- **URL:** `/employee/:id`
- **Method:** `PUT`
- **Parameters:**
  - `id`: Employee ID.
- **Body Parameters:**
  - `name`: New employee name (optional).
  - `department`: New employee department (optional).
  - `salary`: New employee salary (optional).
- **Response:**
  - `200 OK`: Employee details updated successfully.
  - `400 Bad Request`: No valid fields to update.
  - `500 Internal Server Error`: Server error.

## Turnover

### Get Total Turnover

Calculate the total turnover based on delivered bookings.

- **URL:** `/turnOver`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns the total turnover.
  - `404 Not Found`: No turnover found.
  - `500 Internal Server Error`: Server error.

## Pending Bookings

### Get Count of Pending Bookings

Retrieve the count of pending bookings.

- **URL:** `/pendingBookings`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns the count of pending bookings.
  - `404 Not Found`: No pending bookings found.
  - `500 Internal Server Error`: Server error.

## Total Number of Employees

### Get Total Number of Employees

Retrieve the total number of employees.

- **URL:** `/totalEmployee`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns the total number of employees.
  - `404 Not Found`: No employees found.
  - `500 Internal Server Error`: Server error.

## Booking

### Update Booking Status

Update the status of a booking to "delivered".

- **URL:** `/booking/:id`
- **Method:** `PUT`
- **Parameters:**
  - `id`: Booking ID.
- **Response:**
  - `200 OK`: Booking status updated successfully.
  - `500 Internal Server Error`: Server error.

## Service

### Get All Services

Retrieve information about all services.

- **URL:** `/service`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns an array of service objects.
  - `404 Not Found`: No services found.
  - `500 Internal Server Error`: Server error.

### Book a Service

Book a new service.

- **URL:** `/service`
- **Method:** `POST`
- **Body Parameters:**
  - `regNo`: Registration number.
  - `name`: Customer name.
  - `phone`: Customer phone.
  - `serviceType`: Type of service.
  - `currentDate`: Arrival date.
- **Response:**
  - `200 OK`: Service booked successfully.
  - `400 Bad Request`: All fields are required.
  - `500 Internal Server Error`: Server error.

## Car

### Get All Cars

Retrieve information about all cars.

- **URL:** `/car`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns an array of car objects.
  - `404 Not Found`: No cars found.
  - `500 Internal Server Error`: Server error.

### Add New Car

Add a new car.

- **URL:** `/car`
- **Method:** `POST`
- **Body Parameters:**
  - `chassisno`: Chassis number.
  - `engineno`: Engine number.
  - `cartype`: Car type.
  - `modelname`: Model name.
  - `carimage`: Car image.
  - `sideview`: Side view image.
  - `interior`: Interior image.
  - `rearview`: Rear view image.
  - `cardescription`: Car description.
  - `color`: Car color.
  - `price`: Car price.
  - `stock`: Car stock.
- **Response:**
  - `201 Created`: Car added successfully.
  - `400 Bad Request`: Missing required field(s) or image files.
  - `500 Internal Server Error`: Server error.

### Edit Car Details

Edit details of a car.

- **URL:** `/car/:id`
- **Method:** `PUT`
- **Parameters:**
  - `id`: Car ID.
- **Body Parameters:**
  - `chassisno`: New chassis number (optional).
  - `engineno`: New engine number (optional).
  - `cartype`: New car type (optional).
  - `modelname`: New model name (optional).
  - `carimage`: New car image (optional).
  - `sideview`: New side view image (optional).
  - `interior`: New interior image (optional).
  - `rearview`: New rear view image (optional).
  - `cardescription`: New car description (optional).
  - `color`: New car color (optional).
  - `price`: New car price (optional).
  - `stock`: New car stock (optional).
- **Response:**
  - `200 OK`: Car details updated successfully.
  - `400 Bad Request`: No valid fields to update.
  - `500 Internal Server Error`: Server error.

### Delete Car

Delete a car by ID.

- **URL:** `/car/:id`
- **Method:** `DELETE`
- **Parameters:**
  - `id`: Car ID.
- **Response:**
  - `200 OK`: Car deleted successfully.
  - `404 Not Found`: Car not found.
  - `500 Internal Server Error`: Server

error.

## User

### User Signup

Create a new user account.

- **URL:** `/usersignup`
- **Method:** `POST`
- **Body Parameters:**
  - `name`: User name.
  - `phone`: User phone.
  - `address`: User address.
  - `licenceNumber`: User license number.
  - `password`: User password.
- **Response:**
  - `200 OK`: User account created successfully.
  - `400 Bad Request`: All fields are required.
  - `500 Internal Server Error`: Server error.

### User Login

Authenticate a user.

- **URL:** `/userlogin`
- **Method:** `POST`
- **Body Parameters:**
  - `phone`: User phone.
  - `password`: User password.
- **Response:**
  - `200 OK`: Login successful.
  - `401 Unauthorized`: Invalid credentials.
  - `500 Internal Server Error`: Server error.

---

## Common

### Get All Cars

Retrieve information about all cars.

- **URL:** `/car`
- **Method:** `GET`
- **Response:**
  - `200 OK`: Returns an array of car objects.
  - `404 Not Found`: No cars found.
  - `500 Internal Server Error`: Server error.
