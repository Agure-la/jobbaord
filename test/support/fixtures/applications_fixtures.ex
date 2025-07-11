defmodule JobBoard.ApplicationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JobBoard.Applications` context.
  """

  @doc """
  Generate a job_application.
  """
  def job_application_fixture(attrs \\ %{}) do
    {:ok, job_application} =
      attrs
      |> Enum.into(%{
        cover_letter: "some cover_letter"
      })
      |> JobBoard.Applications.create_job_application()

    job_application
  end
end
