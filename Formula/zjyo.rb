class Zjyo < Formula
  desc "Rust port of rupa/z: frecency-based directory jumping, same algorithm and database format"
  homepage "https://github.com/syndbg/zjyo"
  url "https://github.com/syndbg/zjyo/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9c0d2dc9fa030f8019fd39b8660aecc5c2affe8576096463f7d42bc7c9263cc7"
  license "Apache-2.0"
  head "https://github.com/syndbg/zjyo.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bash_completion.install "completions/zjyo.bash" => "zjyo"
    zsh_completion.install "completions/zjyo.zsh" => "_zjyo"
    fish_completion.install "completions/zjyo.fish"
  end

  test do
    ENV["_Z_DATA"] = testpath/".z"
    system bin/"zjyo", "--add"
    assert_match testpath.to_s, shell_output("#{bin}/zjyo -l")
  end
end
