cask "libndi" do
  version "6.3.1.0"
  sha256 "0bba842f9d8323de2ce1c57d229588dae84bbb838be4092be9514830331d8d1d"

  url "https://downloads.ndi.tv/SDK/NDI_SDK_Mac/libNDI_for_Mac.pkg",
      verified: "downloads.ndi.tv/SDK/NDI_SDK_Mac/"
  name "libNDI"
  desc "NDI SDK"
  homepage "https://ndi.video/"

  pkg "libNDI_for_Mac.pkg"

  uninstall pkgutil: "com.newtek.libndi"

  # No zap stanza required
end
