defmodule JobBoardWeb.Router do
  use JobBoardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JobBoardWeb do
    pipe_through :api
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:job_board, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/api", JobBoardWeb do
      pipe_through :api

      #Auth routes
      post "/users/register", UserRegistrationController, :create
      post "/users/login_in", UserSessionController, :create
      delete "/users/log_out", UserSessionController, :delete

      resources "/jobs", JobController, [:new, :edit]
      resources "/applications", JobApplicationController, only: [:create, index]
    end
  end
end
