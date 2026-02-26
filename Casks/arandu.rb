cask "arandu" do
  version "0.8.0"

  on_arm do
    sha256 "de2148c291e40a2a942ac81dd5fe89fc3973a40c1ff54687e86cd79606e25ee1"
    url "https://github.com/devitools/arandu/releases/download/v#{version}/Arandu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "588b05da7a6cf6427240e8e329862f6f97d25a3924f0e8541da54758ccfa0b8c"
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
