
 class Newmat < Formula
  desc ""
  homepage ""
  url "http://www.robertnz.net/ftp/newmat10.tar.gz"
  version "10"
  sha256 "637d18c0363b8bb99c48eb04cce8c182ccbff771df0bf1e2d541e95f6eb34e7b"
  option "without-namespaces", "Build without namespaces"
  
  def install
    unless build.without? "namespaces"
      inreplace "include.h", "//#define use_namespace", "#define use_namespace"
    end
    system "make", "-f", "nm_gnu.mak"
    lib.install "libnewmat.a"
    mkdir "newmat"
    mv ["boolean.h", "controlw.h", "include.h", "myexcept.h", "newmat.h", "newmatap.h", "newmatio.h", "newmatrc.h", 
      "newmatrm.h", "newmatnl.h", "precisio.h", "solution.h", "tmt.h"], "newmat"
    include.install "newmat"
    doc.install "example", "test_exc", "sl_ex", "nl_ex", "AUTHORS", "COPYING", "README", "add_time.png", "rbd.css", "nm10.htm"
  end
  
  test do
    system "#{bin}/example"
  end
end
