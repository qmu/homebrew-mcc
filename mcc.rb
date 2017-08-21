class Mcc < Formula
  VERSION="0.9.2".freeze
  CONFIG_SCHEMA_VERSION="1.0.0".freeze

  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  url "https://github.com/qmu/mcc.git", :tag => "v#{VERSION}"
  sha256 "f55c69663cf027dfab93d72807351c41578aafcbbb7551a62f3d03a6fad9852f"
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
      system "go", "build", "-o", "bin/mcc", "-ldflags", "-X main.Version=#{VERSION}", "-ldflags", "-X main.ConfigSchemaVersion=#{CONFIG_SCHEMA_VERSION}"
      bin.install "bin/mcc"
    end
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
