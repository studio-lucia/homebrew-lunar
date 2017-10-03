class Cinerepak < Formula
  desc "Replace audio in Sega FILM multimedia files"
  homepage "https://github.com/mistydemeo/cinerepak"
  url "https://github.com/mistydemeo/cinerepak/archive/v0.1.0.tar.gz"
  sha256 "d406edb61dfcff1de1ac98e402fb99408fb2b3a5f1ea6e33dd9c632c2d44cc7d"
  head "https://github.com/mistydemeo/cinerepak.git"

  depends_on "rust" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/cinerepak", "--help"
    system "#{bin}/cpkinspect", "--help"
  end
end
