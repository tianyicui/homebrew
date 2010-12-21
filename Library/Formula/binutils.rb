require 'formula'

class Binutils <Formula
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.21.tar.gz'
  homepage 'http://www.gnu.org/software/binutils/binutils.html'

  def options
    [['--default-names', "Do NOT prepend 'g' to the binary; will override system utils."]]
  end

  def install
    ENV.append 'CPPFLAGS', "-I#{include}"

    args = ["--prefix=#{prefix}",
            "--disable-debug",
            "--disable-dependency-tracking",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--disable-werror" ]
    args << "--program-prefix=g" unless ARGV.include? '--default-names'

    system "./configure", *args
    system "make"
    system "make install"
  end
end
