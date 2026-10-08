"""
=====================================================
Day-1 Challenge: Customer Profile & Product Info
=====================================================

Question:
Write a Python program for an online store that shows
a customer's profile and the details of a product.

Part 1: Product Details (fixed data)
    Create variables for a product with:
    - product name (str)
    - brand (str)
    - price (int)
    - rating (float)
    - in stock (bool)

Part 2: Customer Details (user input)
    Ask the user to enter:
    - full name
    - age
    - city
    - email
    - favorite programming language

Part 3: Output
    Print the following in a clean format:
    1. Customer profile (all user inputs)
    2. Product details (all product variables)
    3. Data type of each product variable using type()
    4. Data type of the user's age using type()
    5. A thank-you message with the customer's name

Part 4: Explain
    At the end of the file, write a comment explaining
    why the user's age is a str and not an int.

Rules:
    - Use only variables, print(), input() and type()
    - Use snake_case for variable names

Expected Output (example):
    ==============================
           CUSTOMER PROFILE
    ==============================
    Name: Daniyal Rehman
    Age: 23
    City: Karachi
    Email: daniyal@example.com
    Favorite Language: Python
    ==============================
           PRODUCT DETAILS
    ==============================
    Product: Laptop
    Brand: Dell
    Price: 150000
    Rating: 4.5
    In Stock: True
    ==============================
             DATA TYPES
    ==============================
    Product -> <class 'str'>
    Price -> <class 'int'>
    Rating -> <class 'float'>
    In Stock -> <class 'bool'>
    User Age -> <class 'str'>
    ==============================
    Thank you for visiting, Daniyal Rehman!
"""



# ---------- Part 1: Product Details ----------
product_name = "Laptop"
brand = "Dell"
price = 150000
rating = 4.5
in_stock = True

# ---------- Part 2: Customer Details (user input) ----------
full_name = input("Enter your full name: ")
age = input("Enter your age: ")
city = input("Enter your city: ")
email = input("Enter your email: ")
favorite_language = input("Enter your favorite programming language: ")

# ---------- Part 3: Output ----------
print("==============================")
print("       CUSTOMER PROFILE")
print("==============================")
print("Name:", full_name)
print("Age:", age)
print("City:", city)
print("Email:", email)
print("Favorite Language:", favorite_language)

print("==============================")
print("       PRODUCT DETAILS")
print("==============================")
print("Product:", product_name)
print("Brand:", brand)
print("Price:", price)
print("Rating:", rating)
print("In Stock:", in_stock)

print("==============================")
print("         DATA TYPES")
print("==============================")
print("Product ->", type(product_name))
print("Price ->", type(price))
print("Rating ->", type(rating))
print("In Stock ->", type(in_stock))
print("User Age ->", type(age))
print("==============================")

print("Thank you for visiting,", full_name + "!")

# ---------- Part 4: Explanation ----------
# The input() function always returns a string (str),
# even if the user types a number like 23.
# That is why type(age) shows <class 'str'>.
# To use age as a number, we need to convert it with int(age).
