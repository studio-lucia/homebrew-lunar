class MslScriptTools < Formula
  desc "Pack and unpack Magical School Lunar! data files"
  homepage "https://github.com/mistydemeo/msl_script_tools"
  url "https://github.com/mistydemeo/msl_script_tools/archive/v0.1.0.tar.gz"
  sha256 "f739cbb87cb4f699d1a569595b25e52bae4b8a160b196cd5c142d7a76c58666b"
  head "https://github.com/mistydemeo/msl_script_tools.git"

  depends_on "rust" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/fldpack", "--help"
    system "#{bin}/fldunpack", "--help"
  end
end
