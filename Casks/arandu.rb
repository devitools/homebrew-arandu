cask "arandu" do
  version "0.8.1"

  on_arm do
    sha256 "fc8fe8650aa2a145e71237952df199388a1187ed4e8fac57603d662c575d616e"
    url "https://github.com/devitools/arandu/releases/download/v#{version}/Arandu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "c7750173bbaab39650b01f96a3764165418edc5b66d549a8636a1fbcb0ac0cdc"
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
