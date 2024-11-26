# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.4.41"
  depends_on :macos

  on_intel do
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.4.41/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "4993a10cd139349c83b01b018f2f63ad70487ef85dca8c316e97ce4db1b5e973"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end
  on_arm do
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.4.41/portola-staging_Darwin_arm64.tar.gz"
    sha256 "b98eaf5c0c9fe478071be059f4feefb85807c3f02a37456d4ce3f16d702abf7f"

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
