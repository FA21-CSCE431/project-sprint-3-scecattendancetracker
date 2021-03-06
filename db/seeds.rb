# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

member = Member.create([
                         {
                           admin: 1,
                           first_name: 'Steve',
                           last_name: 'Jobs',
                           email: 'steve.jobs@mail.com',
                           description: 'apple woo',
                           paid_dues: 1,
                           total_attendance: 2
                         },

                         {
                           admin: 0,
                           first_name: 'Frodo',
                           last_name: 'Baggins',
                           email: 'frodo.baggins@hobbit.com',
                           description: 'me short',
                           paid_dues: 0,
                           total_attendance: 2
                         },

                         {
                           admin: 0,
                           first_name: 'Steve',
                           last_name: 'Wozniak',
                           email: 'swozniak@mail.com',
                           description: 'woo apple',
                           paid_dues: 0,
                           total_attendance: 1
                         }
                       ])

event = Event.create([
                       {
                         title: 'WWDC 1976',
                         start_date: Time.new(1976, 0o1, 0o6, 11, 25, 0o0, '+00:00'),
                         end_date: Time.new(1976, 0o1, 0o6, 12, 25, 0o0, '+00:00'),
                         description: 'apple woo',
                         avg_rating: 4.4,
                         location: 'Neverland'
                       },

                       {
                         title: 'Hundred Acre Woods Carrot Festival',
                         start_date: Time.new(2000, 0o6, 24, 12, 0o0, 0o0, '+00:00'),
                         end_date: Time.new(2000, 0o6, 24, 0o3, 30, 0o0, '+00:00'),
                         description: 'eat hunny',
                         avg_rating: 4.8,
                         location: 'Hundred Acre Woods'
                       },

                       {
                         title: 'Tea Party',
                         start_date: Time.new(2045, 10, 0o6, 0o3, 0o0, 0o0, '+00:00'),
                         end_date: Time.new(2045, 10, 0o6, 0o5, 0o0, 0o0, '+00:00'),
                         description: 'have fun with rabbit and cat',
                         avg_rating: 2.5,
                         location: 'Boston'
                       }
                     ])
