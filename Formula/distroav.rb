# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DistroAV < Formula
  version 6.1.1
  sha256 "119e88377a3920216ac2f9e29b174d45c43f855baed14c7b282e35378c0e06d3"

  url "https://github.com/DistroAV/DistroAV/releases/download/#{version}/distroav-#{version}-macos-universal.pkg",
      verified: "github.com/DistroAV/DistroAV/"
  name "DistroAV"
  desc "DistroAV: NDI integration for OBS Studio"
  homepage "https://distroav.org"
  license "GPL-2.0"

  # Requires libndi
  depends_on cask: "libndi"
  # look to have version requirement
  # libndi does not manage teh versioning yet

  # Previous official Cask is a known conflicts
  #conflicts_with "distroav", because: "Cask on official repo is deprecated"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args


    # The pkg installs the plugin files to /Library/Application Support/obs-studio/plugins
    # however OBS Studio expects them to be in ~/Library/Application Support/obs-studio/plugins
    # so we create symlinks to link the plugin files for OBS Studio.
    pkg "distroav-#{version}-macos-universal.pkg"
    
  end

  # The pkg installs the plugin files to /Library/Application Support/obs-studio/plugins
  # however OBS Studio expects them to be in ~/Library/Application Support/obs-studio/plugins
  # so we create symlinks to link the plugin files for OBS Studio.
  def post_install
    puts "Creating #{token} symlinks in ~/Library/Application Support/obs-studio/plugins"
    target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path
    source = "/Library/Application Support/obs-studio/plugins"

    FileUtils.mkdir_p target
    File.symlink("#{source}/distroav.plugin", "#{target}/distroav.plugin")
    File.symlink("#{source}/distroav.plugin.dSYM", "#{target}/distroav.plugin.dSYM")
  end


  # more leftover from the original cask
  # uninstall_preflight do
  #  puts "Removing #{token} symlinks from in ~/Library/Application Support/obs-studio/plugins"
  #  target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path
#
#    if File.symlink?("#{target}/distroav.plugin")
#      File.unlink("#{target}/distroav.plugin", "#{target}/distroav.plugin.dSYM")
#    end
#  end

#  uninstall pkgutil: [
#    "'org.distroav.distroav'",
#    "org.distroav.distroav",
#  ]



  
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test DistroAV`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end


