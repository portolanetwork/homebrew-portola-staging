# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.5.30"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.5.30/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "90ad62235ee08bdcc0f588ce3bdd2a384ed752d022b0840bde0be88aada37130"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.5.30/portola-staging_Darwin_arm64.tar.gz"
    sha256 "1b60d09cc30fe49be538afa3adc1376eb3644de1e3df0fea3b30ae762a072e82"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end

  def caveats
    <<~EOS
      ****************************************************************
      Listen up...
      ****************************************************************
    EOS
  end

  service do
    run [opt_bin/"portd", "service", "start"]
    environment_variables(
      "BREW_APP_FORMULA_NAME" => "staging.portola.app",
      "BREW_APP_BIN_PATH" => "#{bin}",
      "BREW_APP_OPT_HOME" => "#{opt_prefix}",
      "BREW_PREFIX" => "#{HOMEBREW_PREFIX}"
    )
    keep_alive true
    log_path "#{var}/log/staging.portola.app/portd.out.log"
    error_log_path "#{var}/log/staging.portola.app/portd.err.log"
    process_type :background
    working_dir opt_prefix
  end
end
