locals {
  defaults = {
    name = "script"
    image = "ubuntu:20.04"
    interpreter_commands = "bash -c"
    env_variables = []
    labels = {}
    backoff_limit = 4
    wait_for_completion = true
    completion_timeout = "120" # seconds
  }
}