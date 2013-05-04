class ListUser < Hash

  def sign_in(user)
    if (self[user.login].login == user.login and self[user.login].pass == user.pass)
      puts "Logged as #{user.login}"
      return self[user.login]
    end
  end

  def sign_up(user)
    self[user.login] = user

    puts "Created user #{user.login}"
  end

end
