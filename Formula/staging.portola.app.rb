# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class StagingPortolaApp < Formula
  desc ""
  homepage "https://github.com/nomad10101/portola"
  version "0.4.40"
  depends_on :macos

  on_intel do
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.4.40/portola-staging_Darwin_x86_64.tar.gz"
    sha256 "7473fa4365f1f3d6f5698717128a1dfa89351a945a6fa9b865a449cd201ad6ba"

    def install
      bin.install "portd"
      bin.install "portctl"
      prefix.install Dir["cmd/portd/config/staging/resources"]
      prefix.install "cmd/portd/config/staging/deployment.yaml"
    end
  end
  on_arm do
    url "https://github.com/portolanetwork/portola-staging-release/releases/download/v0.4.40/portola-staging_Darwin_arm64.tar.gz"
    sha256 "70678d4f9d73f602045c71ea59d10cea09709d5612ec6a5c2635b4357cce03ab"

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
