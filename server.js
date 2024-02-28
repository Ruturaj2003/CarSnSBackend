const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const multer = require('multer');
const path = require('path');

const app = express();
const port = 8081;
app.use(cors());
app.use(express.json());

app.use('/images', express.static(path.join(__dirname, '../images')));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, '../images');
  },
  filename: (req, file, cb) => {
    cb(
      null,
      file.fieldname + '_' + Date.now() + path.extname(file.originalname)
    );
  },
});

const upload = multer({
  storage: storage,
});

const db = mysql.createConnection({
  connectionLimit: 20,
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'cardb',
});

app.get('/', (req, res) => {
  return res.send('Database Live');
});


//Admin

//Admin login
app.post('/admin', (req, res) => {
  const { email, password } = req.body;

  const sql = 'SELECT * FROM admin WHERE username = ? AND password = ?';
  const values = [email, password];

  db.query(sql, values, (err, result) => {
      if (err) {
          return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (result.length === 0) {
          return res.status(401).json({ error: 'Invalid credentials' });
      }
      return res.status(200).json({ message: 'Login successful' });
  });
});

//customer data
app.get('/customer', (req, res) => {
  const sql = 'SELECT * FROM customer';
  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No products found' });
    }

    return res.send(result);
  });
});

//employee data
app.get('/employee', (req, res) => {
  const sql = 'SELECT * FROM employee';
  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No employee found' });
    }

    return res.send(result);
  });
});

//TurnOver
app.get('/turnOver', (req, res) => {
  const sql = `
    SELECT SUM(car.price) AS total
    FROM car
    JOIN booking ON car.id = booking.carid
    WHERE booking.status = 'delivered'
    `;

  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No cart products found' });
    }

    return res.send(result);
  });
});

//Pending bookings
app.get('/pendingBookings', (req, res) => {
  const sql = `
    SELECT COUNT(*) AS pending
    FROM booking
    WHERE status = 'pending'
    `;

  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No cart products found' });
    }

    return res.send(result);
  });
});

//Total number of employees
app.get('/totalEmployee', (req, res) => {
  const sql = `
    SELECT COUNT(*) AS emp
    FROM employee
    `;

  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No cart products found' });
    }

    return res.send(result);
  });
});

//Click delivered
app.put('/booking/:id', (req, res) => {
  const { id } = req.params;

  const sql = 'UPDATE booking SET status = ? WHERE id = ?';
  const values = ['delivered', id];

  db.query(sql, values, (error, result) => {
    if (error) {
      console.error('Error updating booking status:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      console.log('Booking status updated successfully');
      res.json({ message: 'Booking status updated successfully' });
    }
  });
});

// Deleting customer
app.delete('/customer/:id', (req, res) => {
  const id = req.params.id;

  const sql = 'DELETE FROM customer WHERE id = ?';

  db.query(sql, [id], (err, data) => {
    if (err) {
      console.log('Error in deleting customer', err);
      return res.json(err);
    }
    res.json({ message: 'Customer deleted successfully' });
    console.log('Customer deleted successfully');
  });
});

// Adding new employee
app.post('/employee', (req, res) => {
  const { name, department, salary } = req.body;

  if (!name || !department || !salary) {
    return res.status(400).json({ error: 'Incomplete data' });
  }

  const sql = 'INSERT INTO employee (name, department, salary) VALUES (?, ?, ?)';
  const values = [name, department, salary];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error executing MySQL query: ' + err.stack);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    console.log('Employee added successfully');
    res.status(201).json({ message: 'Employee added successfully' });
  });
});

// Deleting employee
app.delete('/employee/:id', (req, res) => {
  const id = req.params.id;

  const sql = 'DELETE FROM employee WHERE id = ?';

  db.query(sql, [id], (err, data) => {
    if (err) {
      console.log('Error in deleting employee', err);
      return res.json(err);
    }
    res.json({ message: 'Employee deleted successfully' });
    console.log('Employee deleted successfully');
  });
});

//Edit employee
app.put('/employee/:id', (req, res) => {
  const empDetails = req.params.id;
  const updateDetails = req.body;

  const updateFields = Object.keys(updateDetails).filter(
    (field) => updateDetails[field]
  );

  if (updateFields.length === 0) {
    return res.status(400).json({ error: 'No valid fields to update' });
  }

  const sql = `UPDATE employee SET ${updateFields
    .map((field) => `${field} = ?`)
    .join(', ')} WHERE id = ?`;

  const values = updateFields.map((field) => updateDetails[field]);
  values.push(empDetails);

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    return res.json({
      success: true,
      message: 'employee details updated successfully',
    });
  });
});

//Displaying service
app.get('/service', (req, res) => {
  const sql = 'SELECT * FROM services';
  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No employee found' });
    }

    return res.send(result);
  });
});

//Adding New Car
app.post(
  '/car',
  upload.fields([
    { name: 'carimage', maxCount: 1 },
    { name: 'sideview', maxCount: 1 },
    { name: 'interior', maxCount: 1 },
    { name: 'rearview', maxCount: 1 },
  ]),
  (req, res) => {
    const requiredFields = [
      'chassisno',
      'engineno',
      'cartype',
      'modelname',
      'cardescription',
      'color',
      'price',
      'stock',
    ];

    for (const field of requiredFields) {
      if (!req.body[field]) {
        return res
          .status(400)
          .json({ error: `Missing required field: ${field}` });
      }
    }

    const { carimage, sideview, interior, rearview } = req.files;

    if (!carimage || !sideview || !interior || !rearview) {
      return res.status(400).json({ error: 'Missing one or more image files' });
    }

    const sql =
      'INSERT INTO car (`chassisno`, `engineno`, `cartype`, `modelname`,`carimage`, `sideview`, `interior`, `rearview`, `cardescription`,`color`, `price`, `stock`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const values = [
      req.body.chassisno,
      req.body.engineno,
      req.body.cartype,
      req.body.modelname,
      carimage[0].filename,
      sideview[0].filename,
      interior[0].filename,
      rearview[0].filename,
      req.body.cardescription,
      req.body.color,
      req.body.price,
      req.body.stock,
    ];

    db.query(sql, values, (err, data) => {
      if (err) {
        console.error('Error adding car:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
      return res.json({ success: true, message: 'Car added successfully' });
    });
  }
);

//Edit Car Details
app.put('/car/:id', (req, res) => {
  const empDetails = req.params.id;
  const updateDetails = req.body;

  const updateFields = Object.keys(updateDetails).filter(
    (field) => updateDetails[field]
  );

  if (updateFields.length === 0) {
    return res.status(400).json({ error: 'No valid fields to update' });
  }

  const sql = `UPDATE car SET ${updateFields
    .map((field) => `${field} = ?`)
    .join(', ')} WHERE id = ?`;

  const values = updateFields.map((field) => updateDetails[field]);
  values.push(empDetails);

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    return res.json({
      success: true,
      message: 'car details updated successfully',
    });
  });
});

// Deleting Car
app.delete('/car/:id', (req, res) => {
  const id = req.params.id;

  const sql = 'DELETE FROM car WHERE id = ?';

  db.query(sql, [id], (err, data) => {
    if (err) {
      console.log('Error in deleting car', err);
      return res.json(err);
    }
    res.json({ message: 'car deleted successfully' });
    console.log('car deleted successfully');
  });
});

//user

//user signup
app.post('/usersignup', (req, res) => {
  const { name, phone, adress, licenceNumber, password } = req.body;

  if (!name || !phone || !adress || !licenceNumber || !password) {
      return res.status(400).json({ error: "All fields are required" });
  }

  const sql = "INSERT INTO customer (`name`, `phone`, `address`, `licencenumber`, `password`) VALUES (?, ?, ?, ?, ?)";
  const values = [name, phone, adress, licenceNumber, password];

  db.query(sql, values, (err, data) => {
      if (err) {
          return res.status(500).json({ error: "Error inserting data into the database" });
      }
      return res.json({ success: true, data });
  });
});


//user login
app.post('/userlogin', (req, res) => {
  const { phone, password } = req.body;

  const sql = 'SELECT * FROM customer WHERE phone = ? AND password = ?';
  const values = [phone, password];

  db.query(sql, values, (err, result) => {
      if (err) {
          return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (result.length === 0) {
          return res.status(401).json({ error: 'Invalid credentials' });
      }
      return res.status(200).json({ message: 'Login successful' });
  });
});

//Book a service
app.post('/service', (req, res) => {
  const {
    regNo,
    name,
    phone,
    serviceType,
    currentDate
  } = req.body;

  if (
    !regNo ||
    !name ||
    !phone ||
    !serviceType
  ) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  const sql =
    'INSERT INTO services (`registrationnumber`, `customername`, `phone`, `servicetype`, `arrivaldate`) VALUES (?, ?, ?, ?, ?)';
  const values = [
    regNo,
    name,
    phone,
    serviceType,
    currentDate
  ];

  db.query(sql, values, (err, data) => {
    if (err) {
      console.error('Database error:', err);
      return res
        .status(500)
        .json({ error: 'Error inserting data into the database' });
    }
    return res.json({ success: true, data });
  });
});


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});



//common

//cars details
app.get('/car', (req, res) => {
  const sql = 'SELECT * FROM car';
  db.query(sql, (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No products found' });
    }

    return res.send(result);
  });
});