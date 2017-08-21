# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

HOMEBREW_MCC_VERSION='0.9.2'
CONFIG_SCHEMA_VERSION='1.0.0'
class Mcc < Formula
  desc "A terminal dashboard, command launcher, GitHub client.. etc"
  homepage ""
  url 'https://github.com/qmu/mcc.git', :tag => "v#{HOMEBREW_MCC_VERSION}"
  sha256 "aabf03f48171c5da072e86415419fc87cfa1bd15a8601647f5ad39751131df57"
  head 'https://github.com/qmu/mcc.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/qmu/mcc"
    dir.install Dir["*"]
    ldflags = "-ldflags \"-X main.Version=#{HOMEBREW_MCC_VERSION} -X main.ConfigSchemaVersion=#{CONFIG_SCHEMA_VERSION}\""
    cd dir do
      system "glide", "install"
      system "go", "build", ldflags, "-o", "\"bin/mcc\""
    end
  end

  test do
    system "#{bin}/mcc", "-v"
  end
end
