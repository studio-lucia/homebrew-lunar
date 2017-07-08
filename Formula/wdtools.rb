class Wdtools < Formula
  desc "Tools for working with data from Working Designs games"
  homepage "https://github.com/suppertails66/wdtools"
  url "https://github.com/suppertails66/wdtools.git",
    :revision => "502c733cedac407e5a81da89a58beaa365c484bb"
  version "2017-07-06+git502c733cedac407e5a81da89a58beaa365c484bb"
  head "https://github.com/suppertails66/wdtools.git"

  depends_on "libpng"

  def install
    cd "blackt" do
      system "make", "CXX=#{ENV.cxx}", "CINCLUDES=#{ENV.cflags}"
    end

    system "make", "PREFIX=#{prefix}", "CXX=#{ENV.cxx}", "CINCLUDES=#{ENV.cflags} -I./blackt/src"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/vaycmp"
  end
end
