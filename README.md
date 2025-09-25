# 🍕 Pizza Ordering App

[![Made With C#][made-with-csharp]][forthebadge-url]
[![Built With Love][built-with-love]][forthebadge-url]

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-issues-url]

A comprehensive **desktop application** built with C# Windows Forms that provides a complete pizza ordering and management system. This application demonstrates modern software development practices for inventory management, user authentication, order processing, and sales tracking with MySQL database integration.

## 📋 Table of Contents
- [🎯 Project Overview](#-project-overview)
- [✨ Key Features](#-key-features)
- [🛠️ Tech Stack](#️-tech-stack)
- [🏗️ Architecture](#️-architecture)
- [📁 Project Structure](#-project-structure)
- [🚀 Quick Start](#-quick-start)
- [⚙️ Configuration](#️-configuration)
- [📱 Usage Guide](#-usage-guide)
- [🔒 Security Notes](#-security-notes)
- [🚀 Deployment](#-deployment)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [📸 Screenshots](#-screenshots)

## 🎯 Project Overview

**Pizza Ordering App** is a sophisticated Windows Forms desktop application that recreates the pizza ordering and management experience. Built using C# and MySQL, it demonstrates modern software development principles while providing a fully functional point-of-sale system for pizza restaurants.

### 🎯 Target Users
- **🍕 Restaurant Staff**: Process orders, manage inventory, handle sales
- **👥 Administrators**: Full access to products, ingredients, and system management
- **📊 Managers**: Sales tracking and business analytics

### 🌟 Problem Statement
Deliver a comprehensive pizza restaurant management system that handles the complete workflow from order taking to inventory management, with role-based access control and real-time order processing.

## ✨ Key Features

### 🏪 **Sales Management**
- **Pizza Selection**: Visual product catalog with images and pricing
- **Size Options**: Small, Medium, Large with dynamic pricing
- **Add-ons System**: Customizable ingredients with individual pricing
- **Order Summary**: Real-time bill calculation and order tracking
- **Quantity Control**: Easy quantity adjustment with spinner controls

### 📦 **Inventory Management**
- **Product Management**: CRUD operations for pizza products
- **Ingredient Tracking**: Comprehensive ingredient inventory system
- **Stock Control**: Real-time stock levels and availability
- **Image Management**: Product image upload and display
- **Price Management**: Dynamic pricing for products and ingredients

### 🔐 **User Authentication & Roles**
- **Login System**: Username/password authentication
- **Role-Based Access**: Admin and Staff role differentiation
- **Access Control**: Feature restrictions based on user roles
- **Session Management**: Secure login/logout functionality

### 🛒 **Order Processing**
- **Interactive Cart**: Dynamic order building with visual feedback
- **Price Calculation**: Automatic total calculation with add-ons
- **Order Customization**: Size selection and ingredient customization
- **Bill Generation**: Detailed order summary and pricing breakdown

## 🛠️ Tech Stack

### **Core Technologies**
- **Language**: C# .NET Framework 4.7.2+
- **GUI Framework**: Windows Forms
- **Database**: MySQL 8.0+ with XAMPP/phpMyAdmin
- **IDE**: Visual Studio 2019/2022
- **Database Connectivity**: MySQL.Data (MySqlConnector)

### **Development Tools**
- **XAMPP**: Local development server with MySQL and phpMyAdmin
- **phpMyAdmin**: Web-based MySQL database administration
- **Visual Studio Designer**: Windows Forms visual designer
- **MySQL Workbench**: Database design and management (optional)

### **Architecture Patterns**
- **MVC Pattern**: Separation of concerns in application structure
- **Data Access Layer**: Centralized database operations
- **Repository Pattern**: Data access abstraction
- **Factory Pattern**: Database connection management

## 🏗️ Architecture

### **System Architecture**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Presentation   │    │   Business      │    │   Data Layer    │
│     Layer       │    │     Logic       │    │                 │
│                 │    │                 │    │                 │
│ ┌─────────────┐ │    │ ┌─────────────┐ │    │ ┌─────────────┐ │
│ │  Windows    │ │    │ │   Models    │ │    │ │   MySQL     │ │
│ │   Forms     │◄├────┤►│   Classes   │◄├────┤►│  Database   │ │
│ └─────────────┘ │    │ └─────────────┘ │    │ └─────────────┘ │
│ ┌─────────────┐ │    │ ┌─────────────┐ │    │ ┌─────────────┐ │
│ │   Event     │ │    │ │ Database    │ │    │ │  phpMyAdmin │ │
│ │  Handlers   │ │    │ │   Helper    │ │    │ │  Interface  │ │
│ └─────────────┘ │    │ └─────────────┘ │    │ └─────────────┘ │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **Database Schema**
```sql
-- Core Tables
users (id, username, password, role)
products (id, name, price, image, stocks)
ingredients (id, name, serving_size, price_per_serving, stock_available)

-- Relationships
- Users have roles (admin/staff)
- Products can have multiple ingredients as add-ons
- Ingredients track individual pricing and stock levels
```

## 📁 Project Structure

```
pizza-ordering-app/
├── 📄 pizza-ordering-app.csproj      # Visual Studio project file
├── 📄 pizza-ordering-app.sln         # Solution file
├── 📄 App.config                     # Application configuration
├── 📄 packages.config                # NuGet packages configuration
├── 📄 README.md                      # Project documentation
├── 📄 Program.cs                     # Application entry point
├── 📄 DatabaseHelper.cs              # Database connection helper
├── 📄 Login.cs                       # Login form and logic
├── 📄 Login.Designer.cs              # Login form designer
├── 📄 Login.resx                     # Login form resources
├── 📄 AdminDashboard.cs              # Main application form
├── 📄 AdminDashboard.Designer.cs     # Dashboard form designer
├── 📄 AdminDashboard.resx            # Dashboard form resources
├── 📁 Properties/                    # Assembly and project properties
│   ├── 📄 AssemblyInfo.cs            # Assembly metadata
│   ├── 📄 Resources.Designer.cs      # Generated resources
│   ├── 📄 Resources.resx             # Application resources
│   ├── 📄 Settings.Designer.cs       # Generated settings
│   └── 📄 Settings.settings          # Application settings
├── 📁 Resources/                     # Application images and assets
│   ├── 📄 Various pizza images       # Product images
│   └── 📄 UI icons and graphics      # Interface elements
└── 📁 database/                      # Database schema and sample data  
    └── 📄 pizza_app.sql              # Complete database schema
```

## 🚀 Quick Start

### **Prerequisites**
- Windows 10/11
- .NET Framework 4.7.2 or higher
- XAMPP (Apache + MySQL + phpMyAdmin)
- Visual Studio 2019/2022 (Community Edition is fine)

### **Installation**

1. **Clone the Repository**
   ```bash
   git clone https://github.com/elyeandre/pizza-ordering-app.git
   cd pizza-ordering-app
   ```

2. **Database Setup with XAMPP**
   
   **Step 1: Install and Start XAMPP**
   - Download XAMPP from [https://www.apachefriends.org/](https://www.apachefriends.org/)
   - Install XAMPP and start Apache and MySQL services
   
   **Step 2: Create Database via phpMyAdmin**
   - Open browser and go to `http://localhost/phpmyadmin`
   - Click "New" to create a new database
   - Enter database name: `pizza_app`
   - Set collation to `utf8mb4_unicode_ci`
   - Click "Create"

   **Step 3: Import Database Schema**
   ```sql
   -- Create users table
   CREATE TABLE `users` (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `username` varchar(50) NOT NULL,
       `password` varchar(255) NOT NULL,
       `role` enum('admin','staff') NOT NULL DEFAULT 'staff',
       PRIMARY KEY (`id`),
       UNIQUE KEY `username` (`username`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

   -- Create products table
   CREATE TABLE `products` (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `name` varchar(100) NOT NULL,
       `price` decimal(10,2) NOT NULL,
       `image` longblob NOT NULL,
       `stocks` int(11) NOT NULL DEFAULT 0,
       PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

   -- Create ingredients table  
   CREATE TABLE `ingredients` (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `name` varchar(100) NOT NULL,
       `serving_size` varchar(50) NOT NULL,
       `price_per_serving` decimal(10,2) NOT NULL,
       `stock_available` decimal(10,2) NOT NULL DEFAULT 0,
       PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

   -- Insert sample admin user
   INSERT INTO `users` (`username`, `password`, `role`) VALUES
   ('admin', 'admin123', 'admin'),
   ('staff', 'staff123', 'staff');

   -- Insert sample products
   INSERT INTO `products` (`name`, `price`, `stocks`) VALUES
   ('Margherita Pizza', 299.00, 20),
   ('Pepperoni Pizza', 349.00, 15),
   ('Hawaiian Pizza', 389.00, 12),
   ('Meat Lovers Pizza', 449.00, 10);

   -- Insert sample ingredients
   INSERT INTO `ingredients` (`name`, `serving_size`, `price_per_serving`, `stock_available`) VALUES
   ('Extra Cheese', '50g', 25.00, 100),
   ('Pepperoni', '30g', 35.00, 80),
   ('Mushrooms', '40g', 20.00, 60),
   ('Bell Peppers', '30g', 15.00, 70),
   ('Onions', '25g', 10.00, 90),
   ('Olives', '20g', 30.00, 45);
   ```

3. **Configure Database Connection**
   - Open `DatabaseHelper.cs`
   - Update the connection string:
   ```csharp
   private static readonly string ConnectionString = 
       "server=localhost;user id=root;password=;database=pizza_app;";
   ```

4. **Open and Build Project**
   - Open `pizza-ordering-app.sln` in Visual Studio
   - Restore NuGet packages (MySQL.Data)
   - Build the solution (Ctrl+Shift+B)

5. **Run the Application**
   - Press F5 or click "Start" in Visual Studio
   - Login with:
     - **Admin**: username: `admin`, password: `admin123`
     - **Staff**: username: `staff`, password: `staff123`

## ⚙️ Configuration

### **Database Configuration**
Update `DatabaseHelper.cs` for your MySQL setup:

```csharp
public static class DatabaseHelper
{
    // For XAMPP default setup
    private static readonly string ConnectionString = 
        "server=localhost;user id=root;password=;database=pizza_app;";
    
    // For custom MySQL setup
    // private static readonly string ConnectionString = 
    //     "server=localhost;user id=your_username;password=your_password;database=pizza_app;";
        
    public static MySqlConnection GetConnection()
    {
        return new MySqlConnection(ConnectionString);
    }
}
```

### **User Roles Configuration**
Default user roles and permissions:
- **Admin**: Full access to Sales and Inventory management
- **Staff**: Access to Sales only, Inventory button hidden

## 📱 Usage Guide

### **Login System**

1. **Starting the Application**
   - Launch the application
   - Enter username and password
   - Click "Login" to access the system

2. **User Roles**
   - **Admin**: Can access both Sales and Inventory
   - **Staff**: Can only access Sales module

### **Sales Module**

1. **Taking Orders**
   - Click on pizza products to select
   - Choose size (Small/Medium/Large)
   - Select quantity using numeric spinner
   - Add optional ingredients as add-ons
   - Click "Add to Order" to add items to cart

2. **Order Management**
   - View order summary in the bill panel
   - See itemized pricing with add-ons
   - Track total amount in real-time
   - Process multiple items in single order

### **Inventory Module (Admin Only)**

1. **Product Management**
   - View all pizza products in grid format
   - Add new products with images
   - Edit existing product details
   - Delete products from inventory
   - Manage stock levels

2. **Ingredient Management**
   - Maintain ingredient inventory
   - Set serving sizes and pricing
   - Track stock availability
   - Add/edit/delete ingredients

### **System Navigation**

- **Sales Button**: Switch to order processing view
- **Inventory Button**: Access inventory management (admin only)
- **Logout**: Return to login screen

## 🔒 Security Notes

This application uses basic authentication suitable for internal restaurant use.

### Current Implementation
- Simple username/password authentication
- Role-based access control (admin/staff)
- Basic SQL injection protection with parameterized queries
- Local database storage

### Recommended Improvements for Production
- Hash passwords using bcrypt or similar
- Implement session timeout mechanisms
- Add audit trails for inventory changes
- Enable HTTPS for web-based access
- Regular database backups
- User activity logging

## 🚀 Deployment

### **Standalone Application Deployment**

1. **Build Release Version**
   ```bash
   # In Visual Studio
   Build → Configuration Manager → Set to "Release"
   Build → Build Solution
   ```

2. **Prepare Distribution Package**
   ```
   PizzaOrderingApp/
   ├── pizza-ordering-app.exe
   ├── MySql.Data.dll
   ├── App.config
   ├── Resources/
   └── database/
       └── pizza_app.sql
   ```

3. **Installation Requirements**
   - .NET Framework 4.7.2+ (usually pre-installed on Windows 10/11)
   - XAMPP for local database server
   - Minimum 2GB RAM, 100MB storage

### **Database Deployment**

1. **XAMPP Setup on Target Machine**
   - Install XAMPP
   - Start Apache and MySQL services
   - Access phpMyAdmin at `http://localhost/phpmyadmin`

2. **Database Import**
   - Create database named `pizza_app`
   - Import the provided SQL schema
   - Configure connection string in App.config

3. **Network Database (Optional)**
   ```csharp
   // For network MySQL server
   private static readonly string ConnectionString = 
       "server=192.168.1.100;user id=pizza_user;password=secure_password;database=pizza_app;";
   ```

## 🤝 Contributing

We welcome contributions to improve the Pizza Ordering App!

### **Development Setup**

1. **Fork and Clone**
   ```bash
   git clone https://github.com/elyeandre/pizza-ordering-app.git
   cd pizza-ordering-app
   ```

2. **Development Environment**
   - Install Visual Studio 2019/2022
   - Install XAMPP for local MySQL
   - Create feature branch: `git checkout -b feature/your-feature`

### **Contribution Guidelines**

- Follow C# coding conventions
- Test all database operations
- Update documentation for new features
- Ensure compatibility with existing data

### **Areas for Contribution**

- **🛒 Order History**: Customer order tracking
- **📊 Reporting**: Sales analytics and reports  
- **💳 Payment Integration**: Multiple payment methods
- **📱 Mobile Version**: Xamarin or MAUI implementation
- **🔔 Notifications**: Order status notifications
- **🎨 UI/UX**: Modern interface improvements

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 📸 Screenshots

### Login Interface
![Login Screen](https://github.com/user-attachments/assets/4812442a-4206-49d3-a90e-65c7751b5e14)
*Secure login interface with role-based authentication*

### Sales Dashboard  
![Sales Dashboard](https://github.com/user-attachments/assets/d483d2dc-7157-498c-9bbb-7cfac705ad52)
*Interactive sales interface with product selection and order management*

### Inventory Management
![Inventory Management](https://github.com/user-attachments/assets/3c60ff69-e519-4817-a28e-3068eb632512)
*Comprehensive inventory management for products and ingredients*

---

**🍕 Built with ❤️ for Pizza Lovers Everywhere**

*"Bringing technology to traditional pizza making"*

---

[made-with-csharp]: https://img.shields.io/badge/Made%20with-C%23-blue.svg?style=for-the-badge
[built-with-love]: https://img.shields.io/badge/Built%20with-❤️-red.svg?style=for-the-badge
[forthebadge-url]: http://forthebadge.com
[contributors-shield]: https://img.shields.io/github/contributors/elyeandre/pizza-ordering-app.svg?style=for-the-badge
[contributors-url]: https://github.com/elyeandre/pizza-ordering-app/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/elyeandre/pizza-ordering-app.svg?style=for-the-badge
[forks-url]: https://github.com/elyeandre/pizza-ordering-app/network/members
[stars-shield]: https://img.shields.io/github/stars/elyeandre/pizza-ordering-app.svg?style=for-the-badge
[stars-url]: https://github.com/elyeandre/pizza-ordering-app/stargazers
[issues-shield]: https://img.shields.io/github/issues/elyeandre/pizza-ordering-app.svg?style=for-the-badge
[issues-issues-url]: https://github.com/elyeandre/pizza-ordering-app/issues

*Last updated: September 25, 2025*
