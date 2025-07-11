defmodule JobBoard.Repo.Migrations.CreateJobApplication do
  use Ecto.Migration

  def change do
    create table(:job_application, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :cover_letter, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :job_id, references(:jobs, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:job_application, [:user_id])
    create index(:job_application, [:job_id])
  end
end
