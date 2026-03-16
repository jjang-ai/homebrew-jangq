class Jang < Formula
  include Language::Python::Virtualenv

  desc "JANG — Adaptive Mixed-Precision Quantization for Apple Silicon (the GGUF of MLX)"
  homepage "https://jangq.ai"
  url "https://files.pythonhosted.org/packages/47/9d/7a58ac24a199df0f0bf389d2dfdfacc692d37591b355a3c09c3b20461fb9/jang-1.2.1.tar.gz"
  sha256 "8a0202c9c179a056aef677b68ae7259baa15f30f219e09d2775a233bc802d64c"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "--no-deps", cached_download
    system libexec/"bin/pip", "install", "safetensors>=0.4", "numpy>=1.24", "tqdm>=4.60", "huggingface_hub>=0.20"
    bin.install_symlink libexec/"bin/jang"
  end

  test do
    system bin/"jang", "--help"
  end
end
