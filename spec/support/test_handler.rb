class TestHandler < Lita::Handler

  route(/xtest/, nil, dummy: true) do |response|
  end

end
