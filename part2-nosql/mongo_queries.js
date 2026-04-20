// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
  {
    product_id: "E101",
    category: "Electronics",
    product_name: "Smartphone",
    brand: "Samsung",
    price: 45000,
    specifications: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh",
      warranty_years: 2
    },
    features: ["5G", "AMOLED Display", "Fast Charging"]
  },
  {
    product_id: "C201",
    category: "Clothing",
    product_name: "Men's Casual Shirt",
    brand: "Levis",
    price: 1999,
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Blue", "Black", "White"]
  },
  {
    product_id: "G301",
    category: "Groceries",
    product_name: "Organic Milk",
    brand: "Amul",
    price: 60,
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      protein: "3.4g",
      fat: "3.5g",
      calcium: "120mg"
    }
  }
]);


// OP2: find() — Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent field

db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category

db.products.createIndex({ category: 1 });