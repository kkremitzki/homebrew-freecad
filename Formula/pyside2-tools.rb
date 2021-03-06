class Pyside2Tools < Formula
  desc "PySide development tools (pyuic and pyrcc)"
  homepage "https://wiki.qt.io/PySide2"
  url "http://code.qt.io/pyside/pyside-setup.git", :using => :git, :branch => "5.15.0"
  version "5.15.0"
  head "http://code.qt.io/pyside/pyside-setup.git", :branch => "5.15.0" 

  depends_on "cmake" => :build
  depends_on "python3" => :build
  depends_on "FreeCAD/freecad/pyside2"
  bottle do
    root_url "https://dl.bintray.com/vejmarie/freecad"
    cellar :any
    sha256 "601b076fde585b1da7efcd8539a6f82d8a86b4bc3102be6c8e8f141690e0cadd" => :catalina
  end

  def install
      mkdir "macbuild3.8" do
        args = std_cmake_args
        args << "-DUSE_PYTHON_VERSION=3.8"
        args << "../sources/pyside2-tools"

        system "cmake", *args
        system "make", "-j#{ENV.make_jobs}", "install"
      end
  end
end
