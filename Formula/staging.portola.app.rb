# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.4.35"
  depends_on :macos

  url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.4.35/portola-staging_Darwin_x86_64.tar.gz"
  sha256 "5f05102ab66ac20753ddaf54142c1a08501fe84c1994c41de128b1092009ada3"

  def install
    bin.install "portd"
    bin.install "portctl"
    prefix.install Dir["cmd/portd/config/staging/resources"]
    prefix.install "cmd/portd/config/staging/deployment.yaml"
      # Create a wrapper script for portctl to set environment variables
    (echo '#!/bin/bash'; echo 'export MY_ENV_VAR=my_value'; echo 'exec "$@"') > #{bin}/portctl_wrapper
    chmod +x #{bin}/portctl_wrapper
    ln -sf #{bin}/portctl_wrapper #{bin}/portctl
  end

  on_arm do
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for the StagingPortolaApp
        formula at this time. The darwin_amd64 binary may work in compatibility
        mode, but it might not be fully supported.
      EOS
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
        "BREW_BIN" => "#{bin}",
        "BREW_OPT_HOME" => "#{opt_prefix}",
        "BREW_PREFIX" => "#{HOMEBREW_PREFIX}"
    )
    keep_alive true
    log_path "#{var}/log/staging.portola.app/portd.out.log"
    error_log_path "#{var}/log/staging.portola.app/portd.err.log"
    process_type :interactive
    working_dir opt_prefix
  end
end
