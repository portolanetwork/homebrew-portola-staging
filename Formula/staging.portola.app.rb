# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/portolanetwork/portola"
  version "0.6.30"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.6.30/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "42cb57b99b9d924b57eedaca71768caf84bfe25dc8825ca19717c2b11b119014"

    def install
      bin.install "staged"
      bin.install "stagectl"
      prefix.install Dir["cmd/portd/deployment-assets/staging-usw1/resources"]
      prefix.install "cmd/portd/deployment-assets/staging-usw1/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.6.30/portola-staging_Darwin_arm64.tar.gz"
    sha256 "06ff7bde14ee79d9ac1038db71e0ce67d9f24abf4ab5edcd5383ec8e11c3b0a8"

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
      "BREW_APP_FORMULA_NAME" => "staging.portola.app",
      "BREW_APP_BIN_PATH" => "#{bin}",
      "BREW_APP_OPT_HOME" => "#{opt_prefix}",
      "BREW_PREFIX" => "#{HOMEBREW_PREFIX}"
    )
    keep_alive true
    log_path "#{var}/log/staging.portola.app/portd.out.log"
    error_log_path "#{var}/log/staging.portola.app/portd.err.log"
    process_type :interactive
    working_dir opt_prefix
  end
end
