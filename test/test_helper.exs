ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FishCoin.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FishCoin.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FishCoin.Repo)

