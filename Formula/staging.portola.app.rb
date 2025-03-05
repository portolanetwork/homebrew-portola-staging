# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/portolanetwork/portola"
  version "0.7.129"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.129/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "7344a0ffec84caf5b7fba5f8f7ec9b25981c145a4b1d84a3ebbdf91af6f4c285"

    def install
      bin.install "staged"
      bin.install "stagectl"
      prefix.install Dir["cmd/portd/deployment-assets/staging-usw1/resources"]
      prefix.install "cmd/portd/deployment-assets/staging-usw1/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.129/portola-staging_Darwin_arm64.tar.gz"
    sha256 "40655ee606c5450c6ca1ad916e4a5d23a339789a894f08491d768e774e35ca9a"

    def install
      bin.install "staged"
      bin.install "stagectl"
      prefix.install Dir["cmd/portd/deployment-assets/staging-usw1/resources"]
      prefix.install "cmd/portd/deployment-assets/staging-usw1/deployment.yaml"
    end
  end

  def caveats
    <<~EOS
      ****************************************************************
      Installed Portola Staging Formula. To start the service run:
        brew services start staging.portola.app
      ****************************************************************
    EOS
  end

  service do
    run [opt_bin/"staged", "service", "start"]
    environment_variables(
      "BREW_APP_BIN_PATH" => "#{bin}",
      "BREW_APP_OPT_HOME" => "#{opt_prefix}",
      "BREW_PREFIX" => "#{HOMEBREW_PREFIX}"
    )
    keep_alive true
    error_log_path "#{var}/log/staging.portola.app/portd.err.log"
    process_type :interactive
    working_dir opt_prefix
  end
end
