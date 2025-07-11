defmodule JobBoardWeb.JobController do
  use JobBoardWeb, :controller

  alias JobBoard.Jobs.Job
  alias JobBoard.Jobs

  action_fallback JobBoardWeb.FallbackController

  def index(conn, _params) do
    jobs = Jobs.list()
    render(conn, "index.json", jobs: jobs)
  end

  def create(conn, %{"job" => job_params}) do
    with {:ok, %Job{} = job} <- Jobs.create_job(job_params) do
      conn
      |> put_status(:created)
      |> render("show.json", job: job)
    end
  end
end
