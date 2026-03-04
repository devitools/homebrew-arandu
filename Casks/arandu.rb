cask "arandu" do
  version "0.11.1"

  on_arm do
    sha256 "a0247e492cfeb382cc67560393f319f1572d282e0fd578a499a18a8fa890e6fd"
    url "https://github.com/devitools/arandu/releases/download/v#{version}/Arandu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "43a71f8da375b0edc2e04e8b61998784fbbdec8a6c9a1bcb6407bf3fe65be167"
    url "https://github.com/devitools/arandu/releases/download/v#{version}/Arandu_#{version}_x64.dmg"
  end

  name "Arandu"
  desc "Minimal Markdown viewer with GFM support, syntax highlighting, and live reload"
  homepage "https://github.com/devitools/arandu"

  depends_on macos: ">= :ventura"

  app "Arandu.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Arandu.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.devitools.arandu",
    "~/Library/Caches/com.devitools.arandu",
    "~/Library/Preferences/com.devitools.arandu.plist",
  ]
end
