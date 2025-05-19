admin1 = AdminUser.create!(email: 'admin1@pp.com', password: '123456')
admin2 = AdminUser.create!(email: 'admin2@pp.com', password: '123456')

cat1 = Category.create!(name: 'Electrónica', created_by: admin1)
cat2 = Category.create!(name: 'Libros', created_by: admin2)

product1 = Product.create!(name: 'Audífonos', price: 50000, stock: 10, created_by: admin1)
product2 = Product.create!(name: 'Teclado', price: 80000, stock: 5, created_by: admin2)

product1.categories << cat1
product2.categories << cat1
ProductImage.create!(product: product1, url: 'https://via.placeholder.com/150')

client = Client.create!(name: 'Juan Pérez', email: 'juan@example.com')

Purchase.create!(client: client, product: product1)
Purchase.create!(client: client, product: product2)
