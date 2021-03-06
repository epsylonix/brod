defmodule BrodSample.TopicManagment do
  def create(name) do
    topic_config = [
      %{
        config_entries: [],
        num_partitions: 6,
        replica_assignment: [],
        replication_factor: 1,
        topic: name
      }
    ]

    :brod.create_topics(
      ["localhost": 9092],
      topic_config,
      %{timeout: 1_000}
    )
  end

  def delete(name) do
    :brod.delete_topics(
      [localhost: 9092],
      [name],
      10_000
    )
  end
end
