class TestSeeder
  attr_reader :user_id, :visitor_id, :entry_id, :project_id

  def initialize(options={})
    mode = options.fetch(:auto, true)
    if mode
      self.handler("reset")
    end
  end

  def handler(mode, options={})
    case mode
    when "reset"
      self.clear_all
      self.every_table(options)
      puts "Clear and seed successful"
    when "all"
      self.every_table(options)
      puts "Seed all successful"
    when "drop"
      self.clear_all
      puts "Clear all successful"
    when "users"
      self.users(options)
    when "entries"
      self.entries(options)
    when "projects"
      self.projects(options)
    else
      raise "Problem in seed handling"
    end
  end

  protected
  def clear_all
    User.destroy_all
    Entry.destroy_all
    Visitor.destroy_all
    Project.destroy_all
  end

  def every_table(options={})

    user_options = options.fetch(:user_deets, {})
    self.users(user_options)

    visitor_options = options.fetch(:visitor_deets, {})
    self.visitors(visitor_options)

    entries_options = options.fetch(:entries_deets, {})
    self.entries(entries_options)

    project_options = options.fetch(:project_deets, {})
    self.projects(project_options)
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
    user_info = options if options.any?
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
    visitor_info = options if options.any?
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
      visual_type: "youtube",
      repo_url: "http://github.com/test/testFake",
      website_url: "http://testFake.herokuapp.com",
      entry_id: project_entry_id
    }
    project_info = options if options.any?
    project = Project.new(project_info)
    unless project.save
      raise "Problem in projects seed"
    else
      @project_id = project.id
    end
  end

  def entries(options=[])
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
    entries = options if options.any? && options[0].any?
    i = 0
    entries.each do |entry_info|
      entry = Entry.new(entry_info)
      unless entry.save
        raise "Problem in entry seed"
      else
        if i == 0 
          @entry_id = entry.id 
        end
      end
      i += 1
    end
  end

end
