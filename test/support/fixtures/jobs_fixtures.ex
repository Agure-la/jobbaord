defmodule JobBoard.JobsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JobBoard.Jobs` context.
  """

  @doc """
  Generate a job.
  """
  def job_fixture(attrs \\ %{}) do
    {:ok, job} =
      attrs
      |> Enum.into(%{
        company: "some company",
        description: "some description",
        is_active: true,
        location: "some location",
        title: "some title"
      })
      |> JobBoard.Jobs.create_job()

    job
  end
end
