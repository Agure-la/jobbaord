defmodule JobBoard.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :location, :string
      add :company, :string
      add :is_active, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
