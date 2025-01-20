# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.6.9"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.6.9/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "53cbc982d1ba3f3fdf209ea57026e0a3deb9b94fea3755ad47bd474219c71deb"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.6.9/portola-staging_Darwin_arm64.tar.gz"
    sha256 "1bff1b1691bd79017360e7ea1b1f19153df496466ae8af03d47bf3fe25a996c5"

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
      Installed Portola Staging Formula. To start the service run:
        brew services start staging.portola.app
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
    process_type :interactive
    working_dir opt_prefix
  end
end
