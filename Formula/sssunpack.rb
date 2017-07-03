class Sssunpack < Formula
  desc "Unpack Lunar: Silver Star Story Complete data files"
  homepage "https://github.com/mistydemeo/sssunpack"
  url "https://github.com/mistydemeo/sssunpack/archive/v0.3.0.tar.gz"
  sha256 "a72ea8bbe44b4b3b8675d39642c53f3513e5da63a0165ad3fe7c81fd0a6f83d0"
  head "https://github.com/mistydemeo/sssunpack.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/sssunpack"
  end

  test do
    header = "FILE001.DAT\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x04" + ("\x00" * 2024)
    file_data = "\xca\xfe\x1d\xea" + ("\x00" * 2044)
    testfile = testpath/"TEST.DAT"
    testfile.open("w") do |f|
      f.write header
      f.write file_data
    end

    (testpath/"extracted").mkpath
    system "#{bin}/sssunpack", "TEST.DAT", "extracted"
    assert_equal "\xCA\xFE\x1D\xEA", File.read("extracted/TEST.DAT/FILE001.DAT")
  end
end
