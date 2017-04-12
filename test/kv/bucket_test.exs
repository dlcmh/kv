defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link
    {:ok, bucket: bucket} # ExUnit will merge the second element of the tuple,
    # a keyword list, into the test context, a map
  end

  test "stores value by key", %{bucket: bucket} do
    # {:ok, bucket} = KV.Bucket.start_link
    # With ExUnit callbacks in place, `bucket` is now the bucket from the setup macro
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end
end
