local GameState = {
  stack = {}
}

function GameState:push_state(new_state)
  table.insert(self.stack, new_state)
  self:current():onenter()
end

function GameState:pop_state()
  self:current():onexit()
  table.remove(self.stack, #self.stack)
end

function GameState:current()
  return self.stack[#self.stack]
end

return GameState
