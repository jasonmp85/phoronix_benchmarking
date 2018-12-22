workflow "Benchmark" {
  on = "push"
  resolves = ["pgbench", "build-linux-kernel"]
}

action "pgbench" {
  uses = "jasonmp85/phoronix_benchmarking@master"
  args = "pts/pgbench"
}

action "build-linux-kernel" {
  uses = "jasonmp85/phoronix_benchmarking@master"
  args = "pts/build-linux-kernel"
}
