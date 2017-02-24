# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class DevSeeder
  attr_reader :seed_directive
  OPTIONS =     <<-STR
//////////////////////////////////
        SEEDING OPTIONS
//////////////////////////////////

  all -------- for seed all
  drop ------- for anti-seed
  users ------ for seed users
STR

  def initialize
    puts OPTIONS
    @seed_directive = STDIN.gets.chomp
    seed_handler
  end

  def seed_handler
    case self.seed_directive
    when "all"
      self.every_table
      puts "Seed all successful"
    when "drop"
      self.clear_all
      puts "Clear all successful"
    when "users"
      self.users
      puts "Seed users successful"
    else
      puts "didn't get that"
      puts OPTIONS
      @seed_directive = STDIN.gets.chomp
      seed_handler
    end
  end

  def clear_all
    User.destroy_all
  end

  def every_table
    self.users
  end

  def users(options={})
    user_info = {
      username: "test",
      password: "test",
      email: "test@test.com",
      github: "test",
      twitter: "test",
      linkedin: "test"
    }
    user = User.new(user_info)
    unless user.save
      raise "Problem in user seed"
    end
  end
end



dev_seed = DevSeeder.new

