class Jang < Formula
  include Language::Python::Virtualenv

  desc "JANG — Adaptive Mixed-Precision Quantization for Apple Silicon (the GGUF of MLX)"
  homepage "https://jangq.ai"
  url "https://files.pythonhosted.org/packages/84/77/fbeb6331853c499747d55949ddb066259b84f2a52a09698cea17a3e5f7e1/jang-2.5.47.tar.gz"
  sha256 "9e567c0c424a9819f1bfbde3cd0b4cb34b4f5a42b68a2e9b5d3a7c4a8960f740"
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
