# Grocery

This is an example application to use with [Gigalixir][gigalixir].

Grocery is a simplified [Elixir][elixir] [Phoenix][phoenix] project utilizing [Quantum][quantum] for scheduling tasks.

In this application the Quantum schedule is defined in the [/config/config.exs](config/config.exs) file.
The `Grocery.Restocker#fruit/1` function is scheduled to increment the orange count by 1 every 5 minutes, and the apple count by 1 every minute.

The default route `/` displays the current fruit counts.


[elixir]: https://elixir-lang.org/
[gigalixir]: https://www.gigalixir.com/
[phoenix]: https://www.phoenixframework.org/
[quantum]: https://hexdocs.pm/quantum/readme.html
