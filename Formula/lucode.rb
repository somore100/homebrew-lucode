class Lucode < Formula
  desc "Small, readable programming language for logic, math and live relationships"
  homepage "https://github.com/somore100/Lucode"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/somore100/Lucode/releases/download/v0.23.0/lucode-v0.23.0-osx-arm64.tar.gz"
      sha256 "055147c5b327939fd1262069046537bd99f80f6d885106720a988dfe72ac038b"
    end
    on_intel do
      url "https://github.com/somore100/Lucode/releases/download/v0.23.0/lucode-v0.23.0-osx-x64.tar.gz"
      sha256 "5991520188d8216ceebbf2a25a8032950b3ea7c004e9396970767f98062c9f90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/somore100/Lucode/releases/download/v0.23.0/lucode-v0.23.0-linux-arm64.tar.gz"
      sha256 "6a4e17e38f6a25cbb3842e7c9e1f9a1ab335854033f5cf9c1c5162e579efe6a6"
    end
    on_intel do
      url "https://github.com/somore100/Lucode/releases/download/v0.23.0/lucode-v0.23.0-linux-x64.tar.gz"
      sha256 "26489282bd5622b113815bc4c22b46ebb3b9fe2c0e2828b601a826eb1a88be78"
    end
  end

  def install
    bin.install "lucode"
    # macOS only runs signed programs; sign the installed copy (ad hoc, no account needed).
    system "codesign", "--force", "--sign", "-", bin/"lucode" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lucode --version")
  end
end
