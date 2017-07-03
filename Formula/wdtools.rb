class Wdtools < Formula
  desc "Tools for working with data from Working Designs games"
  homepage "https://github.com/suppertails66/wdtools"
  head "https://github.com/suppertails66/wdtools.git"

  stable do
    url "https://github.com/suppertails66/wdtools.git",
      :revision => "f1ba0e0dc86468fb341d908c5a399e4ab2d624aa"
    version "2017-04-09+gitf1ba0e0dc86468fb341d908c5a399e4ab2d624aa"

    patch do
      url "https://github.com/suppertails66/wdtools/pull/3.patch?full_index=1"
      sha256 "ff47c6282011a14e281942f6252ced7672afa79dcbb377c21264aac76360ad15"
    end
  end

  depends_on "libpng"
  depends_on "libvorbis"
  depends_on "sdl2"

  def install
    cd "blackt" do
      system "make", "clean"
      system "make", "CXX=#{ENV.cxx}", "CINCLUDES=#{ENV.cflags}"
    end

    inreplace "Makefile", " tss_items_worked ", ""

    system "make", "PREFIX=#{prefix}", "CXX=#{ENV.cxx}", "CINCLUDES=#{ENV.cflags} -I./blackt/src"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/vaycmp"
  end
end
