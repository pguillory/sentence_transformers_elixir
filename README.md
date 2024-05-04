# SentenceTransformers

This is an Elixir wrapper for the [sentence-transformers] Python library. It
is used to get sentence embeddings from text, for example to use for semantic
search.

It runs a Python process in a port, and therefore requires the system to have
Python 3 installed. However no Python packages are needed, as requirements
will be installed in a venv during the build process.

[sentence-transformers]: https://sbert.net/

## Installation

Add `sentence_transformers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sentence_transformers, "~> 0.1.0"}
  ]
end
```
