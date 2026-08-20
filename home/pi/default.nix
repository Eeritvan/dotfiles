{
  home.file.".pi/agent/models.json".text = ''
    {
      "providers": {
        "hetzner": {
          "baseUrl": "https://inference.hetzner.com/api/v1",
          "api": "openai-completions",
          "apiKey": "$HETZNER_API_KEY",
          "models": [
            {
              "id": "Qwen/Qwen3.6-35B-A3B-FP8"
            }
          ]
        },
        "llama-cpp": {
          "baseUrl": "http://localhost:8080/v1",
          "api": "openai-completions",
          "apiKey": "none",
          "models": [
            {
              "id": "unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_M"
            },
            {
              "id": "unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q6_K"
            }
          ]
        }
      }
    }
  '';
}
