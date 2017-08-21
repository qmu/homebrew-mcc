class Mcc < Formula
  VERSION="0.9.2".freeze
  CONFIG_SCHEMA_VERSION="1.0.0".freeze

  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  url "https://github.com/qmu/mcc/releases/download/v#{VERSION}/darwin_amd64_mcc"
  version VERSION
  sha256 "f55c69663cf027dfab93d72807351c41578aafcbbb7551a62f3d03a6fad9852f"

  def install
    bin.install "mcc"
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
