require 'formula'

class AtsLangAnairiats <Formula
  url 'http://downloads.sourceforge.net/sourceforge/ats-lang/ats-lang-anairiats-0.2.2.tar.gz'
  homepage 'http://www.ats-lang.org'
  md5 '5dfe7c0f2fa22c341e153ed88ffbafa9'

  depends_on 'gmp'

  def install
    ENV.j1
    ENV['ATSHOME']=pwd
    ENV['ATSHOMERELOC']="ATS-#{version}"
    system "./configure", "--prefix=#{prefix}"
    system "make all"
    system "make install"
  end
end
