class Jang < Formula
  include Language::Python::Virtualenv

  desc "JANG — Adaptive Mixed-Precision Quantization for Apple Silicon (the GGUF of MLX)"
  homepage "https://jangq.ai"
  url "https://files.pythonhosted.org/packages/62/e3/8eec338c8d9681be68db9f248e6ca5bc86a92a8f0ffe3945ed56047f33fc/jang-2.5.49.tar.gz"
  sha256 "d8c96c29c50705a031b0230508ab40d24d67fa3dab945416c8e1c9c4eefac7ad"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "--no-deps", cached_download
    system libexec/"bin/pip", "install", "safetensors>=0.4", "numpy>=1.24", "tqdm>=4.60", "huggingface_hub>=0.20", "jinja2>=3.1"
    bin.install_symlink libexec/"bin/jang"
  end

  test do
    system bin/"jang", "--help"
  end
end
