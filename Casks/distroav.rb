cask "distroav" do
  version "6.1.1"
  sha256 "119e88377a3920216ac2f9e29b174d45c43f855baed14c7b282e35378c0e06d3"

  url "https://github.com/DistroAV/DistroAV/releases/download/#{version}/distroav-#{version}-macos-universal.pkg"
  name "DistroAV"
  desc "NDI® Integration for OBS Studio"
  homepage "https://distroav.org"

  pkg "distroav-#{version}-macos-universal.pkg"

  uninstall pkgutil: "org.distroav.distroav"
end
