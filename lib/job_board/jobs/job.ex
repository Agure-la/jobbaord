defmodule JobBoard.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "jobs" do
    field :description, :string
    field :title, :string
    field :location, :string
    field :company, :string
    field :is_active, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:title, :description, :location, :company, :is_active])
    |> validate_required([:title, :description, :location, :company, :is_active])
  end
end
