class MslScriptTools < Formula
  desc "Pack and unpack Magical School Lunar! data files"
  homepage "https://github.com/mistydemeo/msl_script_tools"
  url "https://github.com/mistydemeo/msl_script_tools/archive/v0.2.0.tar.gz"
  sha256 "b791f370fc8c461517dac52649472103bab3ff0d8a89375583a9f57bdc78d052"
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
