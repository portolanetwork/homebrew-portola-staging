# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.0.151"
  depends_on :macos

  url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.0.151/portola-staging-release_Darwin_x86_64.tar.gz"
  sha256 "345def88de777ae09027c9e6940df118c469576bf38379dff9e4e1730e38640a"

  def install
    bin.install "portd"
    bin.install "portctl"
    prefix.install Dir["cmd/portd/config/staging/resources"]
    prefix.install "cmd/portd/config/staging/deployment.yaml"
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
    environment_variables BREW_OPT_HOME: opt_prefix
    keep_alive true
    log_path "#{var}/log/staging-portola.app/portd.out.log"
    error_log_path "#{var}/log/staging-portola.app/portd.err.log"
    process_type :interactive
    working_dir opt_prefix
  end
end
