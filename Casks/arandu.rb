cask "arandu" do
  version "0.15.0"

  on_arm do
    sha256 "2ca3c87272e2b36820692402e87592ebb723257d5a00063d9d5c8a78f8144c2c"
    url "https://github.com/devitools/arandu/releases/download/v#{version}/Arandu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "6b7b60836cec7dc766cb4b77be27db99a23c60bed4594fa3f2a76c982d7d2a0f"
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
