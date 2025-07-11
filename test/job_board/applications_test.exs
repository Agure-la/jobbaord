defmodule JobBoard.ApplicationsTest do
  use JobBoard.DataCase

  alias JobBoard.Applications

  describe "job_application" do
    alias JobBoard.Applications.JobApplication

    import JobBoard.ApplicationsFixtures

    @invalid_attrs %{cover_letter: nil}

    test "list_job_application/0 returns all job_application" do
      job_application = job_application_fixture()
      assert Applications.list_job_application() == [job_application]
    end

    test "get_job_application!/1 returns the job_application with given id" do
      job_application = job_application_fixture()
      assert Applications.get_job_application!(job_application.id) == job_application
    end

    test "create_job_application/1 with valid data creates a job_application" do
      valid_attrs = %{cover_letter: "some cover_letter"}

      assert {:ok, %JobApplication{} = job_application} = Applications.create_job_application(valid_attrs)
      assert job_application.cover_letter == "some cover_letter"
    end

    test "create_job_application/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applications.create_job_application(@invalid_attrs)
    end

    test "update_job_application/2 with valid data updates the job_application" do
      job_application = job_application_fixture()
      update_attrs = %{cover_letter: "some updated cover_letter"}

      assert {:ok, %JobApplication{} = job_application} = Applications.update_job_application(job_application, update_attrs)
      assert job_application.cover_letter == "some updated cover_letter"
    end

    test "update_job_application/2 with invalid data returns error changeset" do
      job_application = job_application_fixture()
      assert {:error, %Ecto.Changeset{}} = Applications.update_job_application(job_application, @invalid_attrs)
      assert job_application == Applications.get_job_application!(job_application.id)
    end

    test "delete_job_application/1 deletes the job_application" do
      job_application = job_application_fixture()
      assert {:ok, %JobApplication{}} = Applications.delete_job_application(job_application)
      assert_raise Ecto.NoResultsError, fn -> Applications.get_job_application!(job_application.id) end
    end

    test "change_job_application/1 returns a job_application changeset" do
      job_application = job_application_fixture()
      assert %Ecto.Changeset{} = Applications.change_job_application(job_application)
    end
  end
end
