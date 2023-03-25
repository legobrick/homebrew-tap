class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/legobrick/autokbisw"
  url "https://github.com/legobrick/autokbisw/archive/refs/tags/1.4.4.tar.gz"
  sha256 "aec964b5c6e2f13dfdef9deaeb0c1539a63f9e848301d3db9ff51d2f1ef1ce20"
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  service do
    run [bin/"autokbisw"]
    keep_alive true
    log_path var/"log/autokbisw.log"
    error_log_path var/"log/autokbisw.log"
  end

  test do
    system bin/"autokbisw", "--help"
  end
end
