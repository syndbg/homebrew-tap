class Onetui < Formula
  desc "Terminal browser for databases and message streams"
  homepage "https://github.com/syndbg/onetui"
  license "Apache-2.0"
  head "https://github.com/syndbg/onetui.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "cyrus-sasl"

  uses_from_macos "perl" => :build

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "onetui", shell_output("#{bin}/onetui --version")
    catalog = JSON.parse(shell_output("#{bin}/onetui schema --datasource postgres"))
    assert_match "postgres.rows", catalog.to_json
  end
end
