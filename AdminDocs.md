### 1. Get Car Stock

- **Endpoint:** `/carStock`
- **Description:** Retrieves information about available car stock, including the model name, car image, and current stock.
- **Method:** GET
- **Response:**
  - 200 OK: Returns an array of car details if available.
  - 404 Not Found: If no products are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 2. Get Customer Data

- **Endpoint:** `/customer`
- **Description:** Fetches information about all customers.
- **Method:** GET
- **Response:**
  - 200 OK: Returns an array of customer details if available.
  - 404 Not Found: If no customer records are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 3. Get Employee Data

- **Endpoint:** `/employee`
- **Description:** Retrieves details of all employees.
- **Method:** GET
- **Response:**
  - 200 OK: Returns an array of employee details if available.
  - 404 Not Found: If no employee records are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 4. Get Turnover

- **Endpoint:** `/turnOver`
- **Description:** Calculates the total turnover based on delivered car prices from bookings.
- **Method:** GET
- **Response:**
  - 200 OK: Returns the total turnover if available.
  - 404 Not Found: If no cart products are found in the delivered status.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 5. Get Pending Bookings

- **Endpoint:** `/pendingBookings`
- **Description:** Counts the number of pending bookings.
- **Method:** GET
- **Response:**
  - 200 OK: Returns the count of pending bookings if available.
  - 404 Not Found: If no pending bookings are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 6. Get Total Number of Employees

- **Endpoint:** `/totalEmployee`
- **Description:** Counts the total number of employees.
- **Method:** GET
- **Response:**
  - 200 OK: Returns the total count of employees if available.
  - 404 Not Found: If no employee records are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 7. Update Booking Status

- **Endpoint:** `/updateBookingStatus/:booking_id`
- **Description:** Updates the status of a booking to 'delivered'.
- **Method:** PUT
- **Response:**
  - 200 OK: If the booking status is updated successfully.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 8. Delete Customer

- **Endpoint:** `/deleteCustomer/:id`
- **Description:** Deletes a customer based on the provided customer ID.
- **Method:** DELETE
- **Response:**
  - 200 OK: If the customer is deleted successfully.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 9. Add Employee

- **Endpoint:** `/addEmployee`
- **Description:** Adds a new employee to the system.
- **Method:** POST
- **Request Body:**
  - `emp_name`: Employee's name.
  - `dept`: Employee's department.
  - `salary`: Employee's salary.
- **Response:**
  - 201 Created: If the employee is added successfully.
  - 400 Bad Request: If the request body is incomplete.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 10. Delete Employee

- **Endpoint:** `/deleteEmployee/:id`
- **Description:** Deletes an employee based on the provided employee ID.
- **Method:** DELETE
- **Response:**
  - 200 OK: If the employee is deleted successfully.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 11. Edit Employee

- **Endpoint:** `/updateEmployee/:id`
- **Description:** Edits the details of an employee based on the provided employee ID.
- **Method:** PUT
- **Response:**
  - 200 OK: If the employee details are updated successfully.
  - 400 Bad Request: If no valid fields are provided for update.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 12. Displaying Services

- **Endpoint:** `/displayService`
- **Description:** Retrieves information about available services.
- **Method:** GET
- **Response:**
  - 200 OK: Returns an array of service details if available.
  - 404 Not Found: If no services are found.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 13. Adding New Car

- **Endpoint:** `/addCar`
- **Description:** Adds a new car to the system with images and other details.
- **Method:** POST
- **Request Body:**
  - `chassis_no`: Chassis number of the car.
  - `Engine_no`: Engine number of the car.
  - `Car_type`: Type of the car.
  - `Model_name`: Name of the car model.
  - `Car_descrip`: Description of the car.
  - `color`: Color of the car.
  - `price`: Price of the car.
  - `stock`: Stock availability.
- **Request Files:**
  - `Car_image`: Car image file.
  - `sideView`: Side view image file.
  - `interior`: Interior image file.
  - `rearView`: Rear view image file.
- **Response:**
  - 200 OK: If the car is added successfully.
  - 400 Bad Request: If any required fields or image files are missing.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 14. Edit Car Details

- **Endpoint:** `/updateCar/:id`
- **Description:** Edits the details of a car based on the provided car ID.
- **Method:** PUT
- **Request Parameters:**
  - `id` (Path Parameter): ID of the car to be updated.
- **Request Body:** (Fields to be updated)
  - `chassis_no`: Updated chassis number.
  - `Engine_no`: Updated engine number.
  - `Car_type`: Updated car type.
  - ... (Include other fields as needed)
- **Response:**
  - 200 OK: If the car details are updated successfully.
  - 400 Bad Request: If no valid fields are provided for update.
  - 500 Internal Server Error: In case of a database or server-related issue.

### 15. Delete Car

- **Endpoint:** `/deleteCar/:id`
- **Description:** Deletes a car based on
