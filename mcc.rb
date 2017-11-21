class Mcc < Formula
  VERSION="0.9.6".freeze

  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  version VERSION
  url "https://github.com/qmu/mcc/releases/download/v#{VERSION}/mcc_v#{VERSION}_darwin_amd64.tar.gz"
  sha256 "1a02325535d2c5b59681c38baa59c18aa58e4d943f2531ddf84aba5cbfc7275a"
  head "https://github.com/qmu/mcc.git", :branch => "master"

  def install
    bin.install 'mcc'
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
