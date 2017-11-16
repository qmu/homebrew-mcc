class Mcc < Formula
  VERSION="0.9.5".freeze
  CONFIG_SCHEMA_VERSION="1.0.0".freeze

  desc "The mcc is a terminal dashboard, command launcher, GitHub client.. etc"
  homepage "https://github.com/qmu"
  version VERSION
  url "https://github.com/qmu/mcc.git", :tag => "v#{VERSION}"
  sha256 "44153f22b396e4a37e3c7e8a1cf049dc4d689ebc18636770d5b9f493f1cd1418"
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
      system("go build -o mcc -ldflags \"-X main.Version=#{VERSION} -X main.ConfigSchemaVersion=#{CONFIG_SCHEMA_VERSION}\"")
      bin.install "mcc"
    end
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
