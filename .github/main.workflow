workflow "Benchmark" {
  on = "push"
  resolves = ["pgbench", "build-linux-kernel"]
}

action "pgbench" {
  uses = "docker://jasonmp85/phoronix-tester:latest"
  args = "pts/pgbench"
}

action "build-linux-kernel" {
  uses = "docker://jasonmp85/phoronix-tester:latest"
  args = "pts/build-linux-kernel"
}
