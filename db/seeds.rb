# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class DevSeeder
  attr_reader :user_id, :visitor_id, :project_entry_id, :project_id
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
    handler(STDIN.gets.chomp)
  end

  def handler(mode)
    case mode
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
      puts "Not a proper option"
      puts OPTIONS
      handler(STDIN.gets.chomp)
    end
  end

  def clear_all
    User.destroy_all
    Visitor.destroy_all
    Entry.destroy_all
    Project.destroy_all
  end

  def every_table
    self.users
    self.visitors
    self.entries
    self.projects
  end
  protected
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
    else
      @user_id = user.id
    end
  end

  def visitors(options={})
    visitor_info = {
      name: "Visi Tor",
      email: "Visi@tor.net"
    }
    visitor = Visitor.new(visitor_info)
    unless visitor.save
      raise "Problem in visitor seed"
    else
      @visitor_id = visitor.id
    end
  end

  def projects(options={})
    project_info = {
      name: "Project 1",
      stack: "Postgresql, Rails, jQuery",
      visual_url: "https://www.youtube.com/embed/p3u1cSIVor0",
      visual_type: "video",
      repo_url: "http://github.com/test/testFake",
      website_url: "http://testFake.herokuapp.com",
      entry_id: project_entry_id
    }
    project = Project.new(project_info)
    unless project.save
      raise "Problem in projects seed"
    else
      @project_id = project.id
    end
  end

  def entries(options={})
    entries = [
      {
        title: "Lots of fun on Project 1",
        body: "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem",
        authorable_type: "User",
        authorable_id: user_id,
        
      },
      {
        title: "Request for Website",
        body: "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining",
        authorable_type: "Visitor",
        authorable_id: visitor_id

      },
      {
        title: "Blog post on lorem",
        body: "of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap 

           essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem ",
        authorable_type: "User",
        authorable_id: user_id


      }
      ]
    i = 0
    entries.each do |entry_info|
      entry = Entry.new(entry_info)
      unless entry.save
        raise "Problem in entry seed"
      else
        if i == 0 
          @project_entry_id = entry.id 
        end
      end
      i += 1
    end
  end
end



dev_seed = DevSeeder.new

