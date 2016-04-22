# Cronitor

A simple client library for calling [cronitor.io](https://cronitor.io) ping URLs.

## To use
* Register your monitor at [cronitor.io](https://cronitor.io). Each monitor has a unique alphanumeric code used for sending pings.
* Use the monitor's alphanumeric code when calling `Cronitor.[run|complete|fail|pause]`, and optionally, your auth_key.
* That's it!

## Installation

  1. Add cronitor to your list of dependencies in `mix.exs`:

        def deps do
          [{:cronitor, "~> 1.0.0"}]
        end

  2. Ensure cronitor is started before your application:

        def application do
          [applications: [:cronitor]]
        end

## Usage

```Elixir
# Begin / ping a monitor
Cronitor.run "monitor code"

# Complete a monitor
Cronitor.complete "monitor code"

# Fail without a custom error message
Cronitor.fail "monitor code"

# Fail with a custom error message
Cronitor.fail "monitor code", msg: "OH NO!"

# Pause a monitor
Cronitor.pause "monitor code", 1

# Same as above, but with an auth_key specified:
Cronitor.run "monitor code", auth_key: "your auth key"
Cronitor.complete "monitor code", auth_key: "your auth key"
Cronitor.fail "monitor code", auth_key: "your auth key"
Cronitor.fail "monitor code", msg: "THIS IS TERRIBLE!", auth_key: "your auth key"
Cronitor.pause "monitor code", 1, auth_key: "your auth key"
```
