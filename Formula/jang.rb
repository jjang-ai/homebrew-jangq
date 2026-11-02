class Jang < Formula
  include Language::Python::Virtualenv

  desc "JANG — Adaptive Mixed-Precision Quantization for Apple Silicon (the GGUF of MLX)"
  homepage "https://jangq.ai"
  url "https://files.pythonhosted.org/packages/f0/76/f08b8306b9dd4491c45fe9084a8ebfaabd0e0a02e69d848b08239555b7f1/jang-2.5.53.tar.gz"
  sha256 "e6a0fdb43591b0a5fc98062dbd2d2739fafde33d4eb2ca947df7811d187d3528"
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
