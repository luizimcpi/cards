# Cards

**TODO: Elixir Course**

## Installation

Check more info at [Install Elixir](https://elixir-lang.org/install.html)

## How to run

start Elixir REPL
```
iex -S mix
```

Creating new Deck
```
Cards.create_deck
```

## Generating new elixir project
```
mix new name_of_project
```

## Install new dependencies
```
go to file mix.exs and put dependencie tuple into deps block
after that you can run the following command inside the project folder

mix deps.get
```

## Generating docs
```
in the mix.exs file put the following tuple inside the deps array

 *{:ex_doc, "~> 0.12"}

write the @moduledoc inside your ex module and put your description (recommend use VSCode with elixir plugin to autocomplete)
Run the following command inside the project folder
*mix docs

Go to doc folder generated and open the index.html file
```