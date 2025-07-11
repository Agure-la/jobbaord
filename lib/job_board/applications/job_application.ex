defmodule JobBoard.Applications.JobApplication do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "job_application" do
    field :cover_letter, :string
    field :user_id, :binary_id
    field :job_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(job_application, attrs) do
    job_application
    |> cast(attrs, [:cover_letter])
    |> validate_required([:cover_letter])
  end
end
