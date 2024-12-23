# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.5.22"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.5.22/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "7b40914566eeb919c16ddf6be0ebb8316a5a2827c118649bcbec361666f4ea3d"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.5.22/portola-staging_Darwin_arm64.tar.gz"
    sha256 "54072e13746f955693268829d3e9d2dcef97a3ff30521e1048e84ecb6b98b419"

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
    process_type :interactive
    working_dir opt_prefix
  end
end
