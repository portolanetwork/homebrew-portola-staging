# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/portolanetwork/portola"
  version "0.7.153"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.153/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "4892959a3a6f77b7711cfeb691429d6c08f48772ce37389690fcc9ff20a7b96c"

    def install
      bin.install "staged"
      bin.install "stagectl"
      prefix.install Dir["cmd/portd/deployment-assets/staging-usw1/resources"]
      prefix.install "cmd/portd/deployment-assets/staging-usw1/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.153/portola-staging_Darwin_arm64.tar.gz"
    sha256 "c492002ff0351373a482467fca9022066c0dcdc294c05c9755281d2867f3b02f"

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
