HOMEBREW_MCC_VERSION="0.9.2".freeze
CONFIG_SCHEMA_VERSION="1.0.0".freeze
class Mcc < Formula
  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  url "https://github.com/qmu/mcc.git", :tag => "v#{HOMEBREW_MCC_VERSION}"
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
      system "glide", "install"
      system "go", "build", "-o", "bin/mcc", "-ldflags", "-X main.Version=#{HOMEBREW_MCC_VERSION}", "-ldflags", "-X main.ConfigSchemaVersion=#{CONFIG_SCHEMA_VERSION}"
      bin.install "bin/mcc"
    end
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
