# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/portolanetwork/portola"
  version "0.7.125"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.125/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "11709d5fd5d48f176abd8a84e04969f54c3bf8de76f676bfe1a79215155af095"

    def install
      bin.install "staged"
      bin.install "stagectl"
      prefix.install Dir["cmd/portd/deployment-assets/staging-usw1/resources"]
      prefix.install "cmd/portd/deployment-assets/staging-usw1/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.7.125/portola-staging_Darwin_arm64.tar.gz"
    sha256 "e45d61a4654eace99876c7e9b58f5d6252da597cca1534e8877a6e95439f97ff"

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
