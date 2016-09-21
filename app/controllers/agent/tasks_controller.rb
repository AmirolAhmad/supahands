class Agent::TasksController < AgentController

  def index
    @tasks = Task.all
  end
end
