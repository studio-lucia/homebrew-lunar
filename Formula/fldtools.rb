class Fldtools < Formula
  desc "Pack and unpack Magical School Lunar! data files"
  homepage "https://github.com/mistydemeo/fldtools"
  url "https://github.com/mistydemeo/fldtools/archive/v0.1.1.tar.gz"
  sha256 "dbb7b26ed7c643ee64d122056e3abcd3064fb2f72a6ecab117a3a23138cec99b"
  head "https://github.com/mistydemeo/fldtools.git"

  depends_on "rust" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/fldpack", "--help"
    system "#{bin}/fldunpack", "--help"
  end
end
