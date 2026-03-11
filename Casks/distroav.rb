# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/rubydoc/Cask/Cask
cask "distroav" do
  version "6.1.1"
  sha256 "119e88377a3920216ac2f9e29b174d45c43f855baed14c7b282e35378c0e06d3"

  url "https://github.com/DistroAV/DistroAV/releases/download/#{version}/distroav-#{version}-macos-universal.pkg",
      verified: "github.com/DistroAV/DistroAV/"
  name "DistroAV"
  desc "NDI integration for OBS Studio"
  homepage "https://distroav.org/"

  depends_on cask: "libndi"

  # libndi cask does not manage the versioning yet (Q12026)

  pkg "distroav-#{version}-macos-universal.pkg"

  # The pkg installs the plugin files to /Library/Application Support/obs-studio/plugins
  # however OBS Studio expects them to be in ~/Library/Application Support/obs-studio/plugins
  # so we create symlinks to link the plugin files for OBS Studio.
  postflight do
    puts "Creating #{token} symlinks in ~/Library/Application Support/obs-studio/plugins"
    target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path
    source = "/Library/Application Support/obs-studio/plugins"

    FileUtils.mkdir_p target

    ["distroav.plugin", "distroav.plugin.dSYM"].each do |entry|
      destination = target/entry
      # Allow update via brew even if the plugin was manually installed.
      FileUtils.rm_r(destination) if destination.exist?
      FileUtils.ln_sf "#{source}/#{entry}", destination
    end
  end

  uninstall_preflight do
    puts "Removing #{token} symlinks from ~/Library/Application Support/obs-studio/plugins"
    target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path

    ["distroav.plugin", "distroav.plugin.dSYM"].each do |entry|
      destination = target/entry
      # Only uninstall if plugin was installed by brew, do not remove manually installed plugin.
      File.unlink(destination) if destination.symlink?
    end
  end

  uninstall pkgutil: "org.distroav.distroav"

  caveats <<~EOS
    DistroAV is installed machine-wide by the pkg installer:
      /Library/Application Support/obs-studio/plugins/

    To make the plugin available to OBS Studio, symlinks are created in your
    user OBS plugins directory:
      ~/Library/Application Support/obs-studio/plugins/

    These symlinks are created automatically during installation and removed
    when this cask is uninstalled via brew.
  EOS
end
