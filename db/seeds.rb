# db/seeds.rb

# Création de quelques utilisateurs
5.times do
  User.create(
    email: Faker::Internet.unique.email,
    password: 'password' # Utilise un mot de passe par défaut
  )
end

users = User.all

# Création des articles associés aux utilisateurs
30.times do
  Article.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 10),
    user: users.sample
  )
end
