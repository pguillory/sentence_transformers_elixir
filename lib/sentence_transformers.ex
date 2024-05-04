defmodule SentenceTransformers do
  use GenServer

  def encode(pid, text) do
    GenServer.call(pid, {:encode, text})
  end

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, opts)
  end

  @run_path "#{:code.priv_dir(:sentence_transformers)}/run.sh"

  def init(opts) do
    {model, opts} = Keyword.pop(opts, :model)
    [] = opts

    port = Port.open({:spawn, @run_path}, [:binary])

    port_opts = %{
      model: model
    }
    {:ok, %{"status" => "ready"}} = call_port(port, port_opts)
    {:ok, port}
  end

  def terminate(_reason, port) do
    Port.close(port)
  end

  def handle_call({:encode, text}, _, port) do
    case call_port(port, %{text: text}) do
      {:ok, response} ->
        {:reply, response["embedding"], port}

      {:error, reason} ->
        {:stop, reason}
    end
  end

  defp call_port(port, request) do
    Port.command(port, [Jason.encode!(request) | "\n"])

    receive do
      {^port, {:data, response_json}} ->
        {:ok, Jason.decode!(response_json)}

      {:EXIT, ^port, reason} ->
        {:error, reason}
    end
  end
end
