class Mcc < Formula
  VERSION="0.9.5".freeze
  CONFIG_SCHEMA_VERSION="1.0.0".freeze

  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  version VERSION
  url "https://github.com/qmu/mcc/releases/download/v#{VERSION}/mcc_v#{VERSION}_darwin_amd64.tar.gz"
  sha256 "e71983bb1b5b1c19df6423e61b67f338305fefaa0705f4337601f19b7ddbbedf"
  head "https://github.com/qmu/mcc.git", :branch => "master"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    bin.install 'mcc'
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
