defmodule JobBoard.JobsTest do
  use JobBoard.DataCase

  alias JobBoard.Jobs

  describe "jobs" do
    alias JobBoard.Jobs.Job

    import JobBoard.JobsFixtures

    @invalid_attrs %{description: nil, title: nil, location: nil, company: nil, is_active: nil}

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Jobs.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Jobs.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      valid_attrs = %{description: "some description", title: "some title", location: "some location", company: "some company", is_active: true}

      assert {:ok, %Job{} = job} = Jobs.create_job(valid_attrs)
      assert job.description == "some description"
      assert job.title == "some title"
      assert job.location == "some location"
      assert job.company == "some company"
      assert job.is_active == true
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jobs.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", location: "some updated location", company: "some updated company", is_active: false}

      assert {:ok, %Job{} = job} = Jobs.update_job(job, update_attrs)
      assert job.description == "some updated description"
      assert job.title == "some updated title"
      assert job.location == "some updated location"
      assert job.company == "some updated company"
      assert job.is_active == false
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Jobs.update_job(job, @invalid_attrs)
      assert job == Jobs.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Jobs.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Jobs.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Jobs.change_job(job)
    end
  end
end
