defmodule JobBoard.Applications do
  @moduledoc """
  The Applications context.
  """

  import Ecto.Query, warn: false
  alias JobBoard.Repo

  alias JobBoard.Applications.JobApplication

  @doc """
  Returns the list of job_application.

  ## Examples

      iex> list_job_application()
      [%JobApplication{}, ...]

  """
  def list_job_application do
    Repo.all(JobApplication)
  end

  @doc """
  Gets a single job_application.

  Raises `Ecto.NoResultsError` if the Job application does not exist.

  ## Examples

      iex> get_job_application!(123)
      %JobApplication{}

      iex> get_job_application!(456)
      ** (Ecto.NoResultsError)

  """
  def get_job_application!(id), do: Repo.get!(JobApplication, id)

  @doc """
  Creates a job_application.

  ## Examples

      iex> create_job_application(%{field: value})
      {:ok, %JobApplication{}}

      iex> create_job_application(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_job_application(attrs \\ %{}) do
    %JobApplication{}
    |> JobApplication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a job_application.

  ## Examples

      iex> update_job_application(job_application, %{field: new_value})
      {:ok, %JobApplication{}}

      iex> update_job_application(job_application, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_job_application(%JobApplication{} = job_application, attrs) do
    job_application
    |> JobApplication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a job_application.

  ## Examples

      iex> delete_job_application(job_application)
      {:ok, %JobApplication{}}

      iex> delete_job_application(job_application)
      {:error, %Ecto.Changeset{}}

  """
  def delete_job_application(%JobApplication{} = job_application) do
    Repo.delete(job_application)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking job_application changes.

  ## Examples

      iex> change_job_application(job_application)
      %Ecto.Changeset{data: %JobApplication{}}

  """
  def change_job_application(%JobApplication{} = job_application, attrs \\ %{}) do
    JobApplication.changeset(job_application, attrs)
  end
end
