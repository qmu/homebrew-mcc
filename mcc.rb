VERSION="0.9.2".freeze
CONFIG_SCHEMA_VERSION="1.0.0".freeze
class Mcc < Formula
  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  url "https://github.com/qmu/mcc/releases/download/v#{VERSION}/darwin_amd64_mcc"
  sha256 "aabf03f48171c5da072e86415419fc87cfa1bd15a8601647f5ad39751131df57"
  head "https://github.com/qmu/mcc.git", :branch => "master"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/qmu/mcc"
    dir.install Dir["*"]
    cd dir do
      bin.install "mcc"
    end
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
