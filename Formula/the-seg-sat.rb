class LoveRequirement < Requirement
  fatal true
  cask "love"

  satisfy { which "love" }
end

class TheSegSat < Formula
  desc "Love2D Sega Saturn font viewer"
  homepage "https://github.com/doyousketch2/theSegSat"
  url "https://github.com/doyousketch2/theSegSat/archive/20701a34fc218ff16fbc97ef14a76856b1789b21.tar.gz"
  sha256 "34c360bc454374c6895e2b794b07d81a1bfe755e9eeaf14cd39cfc0c74f8e9c0"
  version "2017-06-17+git34c360bc454374c6895e2b794b07d81a1bfe755e9eeaf14cd39cfc0c74f8e9c0"
  head "https://github.com/doyousketch2/theSegSat.git"

  depends_on LoveRequirement

  def install
    pkgshare.install Dir["*"]
    (bin/"theSegSat").write <<-EOS.undent
    #!/bin/sh
    exec love #{pkgshare}
    EOS
  end

  def caveats; <<-EOS.undent
    Before running, copy the FONT.DAT and FONT8.DAT files from the TEXT directory
    on your Lunar: Silver Star Story CD into #{pkgshare}.
    EOS
  end
end
