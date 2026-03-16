# Homebrew Tap for JANG

[JANG](https://github.com/jjang-ai/jangq) — Adaptive Mixed-Precision Quantization for Apple Silicon. The GGUF equivalent for MLX.

## Install

```bash
brew tap jjang-ai/jangq
brew install jang
```

## Usage

```bash
# Convert any HuggingFace model
jang convert Qwen/Qwen3.5-35B-A3B -p 4

# 2-bit for extreme compression
jang convert model -p 2
```

## Links

- [GitHub](https://github.com/jjang-ai/jangq)
- [PyPI](https://pypi.org/project/jang/)
- [HuggingFace Models](https://huggingface.co/JANGQ-AI)
- [MLX Studio](https://mlx.studio)
