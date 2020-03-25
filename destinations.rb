

class BrooklynDestination

  def allows messenger
    messenger.weight! <= 1000
  end

end

class MatrixDestination

  def allows messenger
    messenger.can_call
  end
end
