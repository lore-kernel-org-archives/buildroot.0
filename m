From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:08 +0100
Subject: [Buildroot] [PATCH 18/32] package/python*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-19-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/python-argh/python-argh.hash                       | 4 +++-
 package/python-backports-abc/python-backports-abc.hash     | 6 ++++--
 .../python-backports-shutil-get-terminal-size.hash         | 6 ++++--
 package/python-characteristic/python-characteristic.hash   | 4 +++-
 package/python-chardet/python-chardet.hash                 | 4 +++-
 package/python-coherence/python-coherence.hash             | 1 +
 package/python-configshell-fb/python-configshell-fb.hash   | 1 +
 package/python-constantly/python-constantly.hash           | 4 +++-
 package/python-crc16/python-crc16.hash                     | 1 +
 package/python-crcmod/python-crcmod.hash                   | 4 +++-
 package/python-dialog3/python-dialog3.hash                 | 4 +++-
 package/python-dicttoxml/python-dicttoxml.hash             | 4 +++-
 package/python-docopt/python-docopt.hash                   | 1 +
 package/python-enum34/python-enum34.hash                   | 6 ++++--
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash     | 4 +++-
 package/python-gobject/python-gobject.hash                 | 2 ++
 package/python-hpack/python-hpack.hash                     | 4 +++-
 package/python-humanize/python-humanize.hash               | 4 +++-
 package/python-id3/python-id3.hash                         | 1 +
 .../python-ipython-genutils/python-ipython-genutils.hash   | 6 ++++--
 package/python-jsonschema/python-jsonschema.hash           | 5 ++++-
 package/python-libconfig/python-libconfig.hash             | 1 +
 package/python-mad/python-mad.hash                         | 1 +
 package/python-mwscrape/python-mwscrape.hash               | 3 ++-
 package/python-netaddr/python-netaddr.hash                 | 4 +++-
 package/python-networkmanager/python-networkmanager.hash   | 2 ++
 package/python-pam/python-pam.hash                         | 1 +
 package/python-pathtools/python-pathtools.hash             | 2 ++
 package/python-priority/python-priority.hash               | 4 +++-
 package/python-pyasn-modules/python-pyasn-modules.hash     | 4 +++-
 package/python-pycli/python-pycli.hash                     | 6 ++++--
 package/python-pycrypto/python-pycrypto.hash               | 7 ++++++-
 package/python-pygame/python-pygame.hash                   | 3 +++
 package/python-pyicu/python-pyicu.hash                     | 6 ++++--
 package/python-pyinotify/python-pyinotify.hash             | 3 ++-
 package/python-pyparted/python-pyparted.hash               | 1 +
 package/python-pypcap/python-pypcap.hash                   | 1 +
 package/python-pyqrcode/python-pyqrcode.hash               | 4 +++-
 package/python-pyratemp/python-pyratemp.hash               | 3 ++-
 package/python-pyrex/python-pyrex.hash                     | 3 ++-
 package/python-pyro/python-pyro.hash                       | 4 +++-
 package/python-pysendfile/python-pysendfile.hash           | 1 +
 package/python-pysmb/python-pysmb.hash                     | 6 ++++--
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash         | 4 +++-
 package/python-pyudev/python-pyudev.hash                   | 4 +++-
 package/python-pyusb/python-pyusb.hash                     | 4 +++-
 package/python-rpi-gpio/python-rpi-gpio.hash               | 2 ++
 package/python-rtslib-fb/python-rtslib-fb.hash             | 1 +
 package/python-setproctitle/python-setproctitle.hash       | 4 +++-
 package/python-sh/python-sh.hash                           | 6 ++++--
 package/python-singledispatch/python-singledispatch.hash   | 4 +++-
 package/python-slob/python-slob.hash                       | 3 ++-
 package/python-smbus-cffi/python-smbus-cffi.hash           | 4 +++-
 package/python-systemd/python-systemd.hash                 | 6 ++++--
 package/python-tomako/python-tomako.hash                   | 4 +++-
 package/python-typepy/python-typepy.hash                   | 4 +++-
 package/python-wcwidth/python-wcwidth.hash                 | 6 ++++--
 package/python-whoosh/python-whoosh.hash                   | 6 ++++--
 package/python-xlutils/python-xlutils.hash                 | 2 ++
 package/python-xlwt/python-xlwt.hash                       | 2 ++
 60 files changed, 160 insertions(+), 52 deletions(-)
 create mode 100644 package/python-pygame/python-pygame.hash

diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
index 6f19de10be..163ea6cee8 100644
--- a/package/python-argh/python-argh.hash
+++ b/package/python-argh/python-argh.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/argh/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/argh/json
 md5	edda25f3f0164a963dd89c0e3c619973  argh-0.26.2.tar.gz
+# Locally computed
 sha256	e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65  argh-0.26.2.tar.gz
+sha256  9c318783389a2e78735dc3d633e745e5648b826744521857045e84ed2e79ce2e  README.rst
diff --git a/package/python-backports-abc/python-backports-abc.hash b/package/python-backports-abc/python-backports-abc.hash
index f638527d7b..4f4c9bd1fe 100644
--- a/package/python-backports-abc/python-backports-abc.hash
+++ b/package/python-backports-abc/python-backports-abc.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/backports_abc/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/backports_abc/json
 md5 7d1936ec183a3586290adf60f6f96764 backports_abc-0.5.tar.gz
-sha256 033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde backports_abc-0.5.tar.gz
+# Locally computed
+sha256  033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde  backports_abc-0.5.tar.gz
+sha256  0a4f3b38055f50f047a42521568fa6ddb9a5976c2884f6ae138796d0f71150ca  LICENSE
diff --git a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
index c1b65e5987..40883a4e3b 100644
--- a/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
+++ b/package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/backports.shutil_get_terminal_size/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/backports.shutil_get_terminal_size/json
 md5 03267762480bd86b50580dc19dff3c66 backports.shutil_get_terminal_size-1.0.0.tar.gz
-sha256 713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80 backports.shutil_get_terminal_size-1.0.0.tar.gz
+# Locally computed
+sha256  713e7a8228ae80341c70586d1cc0a8caa5207346927e23d09dcbcaf18eadec80  backports.shutil_get_terminal_size-1.0.0.tar.gz
+sha256  9edd99f8c339cddbfe36a9707e671fccf245b3e50b80eec0877dccec87a2dfe4  LICENSE
diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
index 41dc18ccae..2a5c7f5cdd 100644
--- a/package/python-characteristic/python-characteristic.hash
+++ b/package/python-characteristic/python-characteristic.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913, sha256 locally computed.
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
 md5	b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
+# Locally computed
 sha256	ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
+sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 799713cf5d..a1804603a2 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/chardet/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/chardet/json
 md5	7dd1ba7f9c77e32351b0a0cfacf4055c  chardet-3.0.4.tar.gz
+# Locally computed
 sha256	84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae  chardet-3.0.4.tar.gz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/python-coherence/python-coherence.hash b/package/python-coherence/python-coherence.hash
index 533d0c6631..3c2d45b537 100644
--- a/package/python-coherence/python-coherence.hash
+++ b/package/python-coherence/python-coherence.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  97c8b700b3fe73d48eacb259008f410d6567e5d7d1b8e96386f8cc2422135ca5  python-coherence-b7856985fd496689ca1f9024925ae737297c00d1.tar.gz
+sha256  7713ed8484b4d3364c7f6f2c02aed427b06a0159b1f77aecf907d47016812e81  LICENCE
diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 58f0564ccc..0903e284aa 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  3685446d6ee02881930bb2fdc5fdd254938da66ce9843a5b3676c4246b058e4b  python-configshell-fb-1.1.fb18.tar.gz
+sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-constantly/python-constantly.hash b/package/python-constantly/python-constantly.hash
index fb7787709c..d2033de373 100644
--- a/package/python-constantly/python-constantly.hash
+++ b/package/python-constantly/python-constantly.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/constantly/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/constantly/json
 md5	f0762f083d83039758e53f8cf0086eef  constantly-15.1.0.tar.gz
+# Locally computed
 sha256	586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35  constantly-15.1.0.tar.gz
+sha256  020870fcaf4bf9c50b233e331817094fe109b91c0880570fd476f527cfbfc085  LICENSE
diff --git a/package/python-crc16/python-crc16.hash b/package/python-crc16/python-crc16.hash
index 81b39a0376..4576a907ec 100644
--- a/package/python-crc16/python-crc16.hash
+++ b/package/python-crc16/python-crc16.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  10aeda70fbe8b284874b3b1b8f74b9c1f6d5e8dee20ac8f9d5bc49f45f12a42a  python-crc16-0.1.1.tar.gz
+sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  COPYING.txt
diff --git a/package/python-crcmod/python-crcmod.hash b/package/python-crcmod/python-crcmod.hash
index 7ce549c302..8ba98d3c01 100644
--- a/package/python-crcmod/python-crcmod.hash
+++ b/package/python-crcmod/python-crcmod.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/crcmod/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/crcmod/json
 md5	2d5b92117d958dcead94f9e17f54cd32  crcmod-1.7.tar.gz
+# Locally computed
 sha256	dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e  crcmod-1.7.tar.gz
+sha256  89480768826f408daea1f3caff0509c2cc9606e10f6bb0ccfd12a3d604842c35  LICENSE
diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
index dae863b76a..83e26c5727 100644
--- a/package/python-dialog3/python-dialog3.hash
+++ b/package/python-dialog3/python-dialog3.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pythondialog/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pythondialog/json
 md5	3d5ebc33e85f6313964f5eef720dab19  pythondialog-3.4.0.tar.bz2
+# Locally computed
 sha256  019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe  pythondialog-3.4.0.tar.bz2
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index 32ba6b0fd0..45c9fc8cc4 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/dicttoxml/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/dicttoxml/json
 md5	ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
+# Locally computed
 sha256	ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
+sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-docopt/python-docopt.hash b/package/python-docopt/python-docopt.hash
index c38e1ab737..eebfd5cc93 100644
--- a/package/python-docopt/python-docopt.hash
+++ b/package/python-docopt/python-docopt.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  2113eed1e7fbbcd43fb7ee6a977fb02d0b482753586c9dc1a8e3b7d541426e99  python-docopt-0.6.2.tar.gz
+sha256  3d5df78f592ff2433c3c6ce4984091b7f497059ddb8c6b08a061ba48e37b67f2  LICENSE-MIT
diff --git a/package/python-enum34/python-enum34.hash b/package/python-enum34/python-enum34.hash
index a5f0c65352..7c0746f80b 100644
--- a/package/python-enum34/python-enum34.hash
+++ b/package/python-enum34/python-enum34.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/enum34/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/enum34/json
 md5 5f13a0841a61f7fc295c514490d120d0 enum34-1.1.6.tar.gz
-sha256 8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1 enum34-1.1.6.tar.gz
+# Locally computed
+sha256  8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1  enum34-1.1.6.tar.gz
+sha256  88ec6a6c8eafa3b9757e745783938bef3f5e4d5e3c76b1db576aa3ab520e5e1d  enum/LICENSE
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index a25fbb7294..4204f59dd5 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/flask-jsonrpc/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/flask-jsonrpc/json
 md5	5c0592f53b2f18e34d5be435acee8842  Flask-JSONRPC-0.3.1.tar.gz
+# Locally computed
 sha256	4d0cc9c20874093306af91f5a48009fb8659a041428dcdb11703598ffbbc97d0  Flask-JSONRPC-0.3.1.tar.gz
+sha256  f613b06cbe766fd514b1b619a71a12c353cccaa55fa4f547be55563d9829be6f  setup.py
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 024419e965..0c093f3306 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,2 +1,4 @@
 # from http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.6.sha256sum
 sha256	fb8a1d4f665130a125011659bd347c7339c944232163dbb9a34fd0686577adb8  pygobject-2.28.6.tar.xz
+# Locally computed
+sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index 445d4d59f5..72886b0edd 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/hpack/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/hpack/json
 md5	556b0ae66180f54c2ce8029a0952088b  hpack-3.0.0.tar.gz
+# Locally computed
 sha256	8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2  hpack-3.0.0.tar.gz
+sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index bb66e44467..47b5f70c9a 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/humanize/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/humanize/json
 md5	e8473d9dc1b220911cac2edd53b1d973  humanize-0.5.1.tar.gz
+# Locally computed
 sha256	a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19  humanize-0.5.1.tar.gz
+sha256  2ee89d331213b5886ae5416ead178694ac0eb13bb79c83bf92287f95d3597377  LICENCE
diff --git a/package/python-id3/python-id3.hash b/package/python-id3/python-id3.hash
index 28b58e8954..c83b34a2d9 100644
--- a/package/python-id3/python-id3.hash
+++ b/package/python-id3/python-id3.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  ba612342b59a49cbf9a7eb23a646667757ffda96dc23b67245fc6cd8d90c2022  id3-py_1.2.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
index 6fa2bc54db..579cc76423 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.hash
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipython_genutils/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/ipython_genutils/json
 md5 5a4f9781f78466da0ea1a648f3e1f79f ipython_genutils-0.2.0.tar.gz
-sha256 eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8 ipython_genutils-0.2.0.tar.gz
+# Locally computed
+sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
+sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index fc13630d66..c631fe981e 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,3 +1,6 @@
-# md5 from https://pypi.python.org/pypi/jsonschema/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/jsonschema/json
 md5	374e848fdb69a3ce8b7e778b47c30640  jsonschema-2.5.1.tar.gz
+# Locally computed
 sha256	36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41  jsonschema-2.5.1.tar.gz
+sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
+sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-libconfig/python-libconfig.hash b/package/python-libconfig/python-libconfig.hash
index 3839043439..6d77fad5c6 100644
--- a/package/python-libconfig/python-libconfig.hash
+++ b/package/python-libconfig/python-libconfig.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  f4cfb7e60b8fcee32ca3392c99932c579038db0852c1c2c42d7c4b859eea3c5c  python-libconfig-b271c3d9dac938ad5cd29b67bd08cc5536a5a391.tar.gz
+sha256  7e47579751c8125eaa031fd10b197d3956d231323598a42612f30abf19c7fed0  README
diff --git a/package/python-mad/python-mad.hash b/package/python-mad/python-mad.hash
index ab91c3fe44..7b19ae5a44 100644
--- a/package/python-mad/python-mad.hash
+++ b/package/python-mad/python-mad.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  1c9fc529b78de7d26e9e47cf182c9f8bf43838d8f62a9c1773540d57f5ebc522  pymad-0.6.tar.gz
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/python-mwscrape/python-mwscrape.hash b/package/python-mwscrape/python-mwscrape.hash
index b91ef69a28..e6bdf396c8 100644
--- a/package/python-mwscrape/python-mwscrape.hash
+++ b/package/python-mwscrape/python-mwscrape.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 8de8a5ef257851f6e1e41247f64710f48859a5e3f91ebc7200bb60769f02f296  python-mwscrape-6a58d7801eb1e884fd0516f1adbedbd4481c10e6.tar.gz
+sha256  8de8a5ef257851f6e1e41247f64710f48859a5e3f91ebc7200bb60769f02f296  python-mwscrape-6a58d7801eb1e884fd0516f1adbedbd4481c10e6.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE.txt
diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index 59628dbdfb..c834721d2c 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/netaddr/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/netaddr/json
 md5 51019ef59c93f3979bcb37d3b8527e07 netaddr-0.7.19.tar.gz
+# Locally computed
 sha256 38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd netaddr-0.7.19.tar.gz
+sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index 83621761cd..6ca94450f0 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,5 @@
 # md5 and sha256 from https://pypi.python.org/pypi/python-networkmanager/json
 md5	f638d854a3639fb37c0e06d1092a771e  python-networkmanager-2.1.tar.gz
 sha256	aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc  python-networkmanager-2.1.tar.gz
+# Locally computed
+sha256  be40f44d54bb5e0f0eee28e957ad020a00a6e3adb0290262e92129eba1c044cf  COPYING
diff --git a/package/python-pam/python-pam.hash b/package/python-pam/python-pam.hash
index 14a89484a1..303455ae2f 100644
--- a/package/python-pam/python-pam.hash
+++ b/package/python-pam/python-pam.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  796ac019b9ee805696d0d277d8fb912fa2391b6ac070dc6f9f1a9a0fadbc3a5a  PyPAM-0.5.0.tar.gz
+sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/python-pathtools/python-pathtools.hash b/package/python-pathtools/python-pathtools.hash
index 1fa624df02..6d7b2975db 100644
--- a/package/python-pathtools/python-pathtools.hash
+++ b/package/python-pathtools/python-pathtools.hash
@@ -2,3 +2,5 @@
 md5	9a1af5c605768ea5804b03b734ff0f82  pathtools-0.1.2.tar.gz
 # sha256 calculated by scanpypi
 sha256	7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0  pathtools-0.1.2.tar.gz
+# Locally computed
+sha256  b52d83fba08f61bd1e603fee1b44cbc7ead9fcb512a5ceb8c53fec90ba415ac4  LICENSE
diff --git a/package/python-priority/python-priority.hash b/package/python-priority/python-priority.hash
index e115d6a4ef..c947375700 100644
--- a/package/python-priority/python-priority.hash
+++ b/package/python-priority/python-priority.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/priority/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/priority/json
 md5	4f1ff52f7fa448e9d9cb46337ae86d1e  priority-1.3.0.tar.gz
+# Locally computed
 sha256	6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe  priority-1.3.0.tar.gz
+sha256  f3e9c29e3db36dc305a4be68a8a225f93949852ce2d19b5b0a3c099eee6509c5  LICENSE
diff --git a/package/python-pyasn-modules/python-pyasn-modules.hash b/package/python-pyasn-modules/python-pyasn-modules.hash
index 6d9a707931..e5880d24ea 100644
--- a/package/python-pyasn-modules/python-pyasn-modules.hash
+++ b/package/python-pyasn-modules/python-pyasn-modules.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=178129bc7fbf07215c25230c5f053f81, sha256 locally computed.
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=178129bc7fbf07215c25230c5f053f81
 md5	178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
+# Locally computed
 sha256	10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
+sha256  8bea85439e7446ecb270079cce926d605a7d10f51fe8789b1aeced557dcbe1b6  LICENSE.txt
diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
index 46a297e6d9..f0890e83a9 100644
--- a/package/python-pycli/python-pycli.hash
+++ b/package/python-pycli/python-pycli.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pycli/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pycli/json
 md5 89c487e7c8068ce05d63394d2ae7ebad pyCLI-2.0.3.tar.gz
-sha256 bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622 pyCLI-2.0.3.tar.gz
+# Locally computed
+sha256  bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622  pyCLI-2.0.3.tar.gz
+sha256  591490b2ef462a4ad2be1aae5dd47738cb17e191c82d3ba38c3ae906d288e6ba  lib/cli/__init__.py
diff --git a/package/python-pycrypto/python-pycrypto.hash b/package/python-pycrypto/python-pycrypto.hash
index 46378945d8..a16a446084 100644
--- a/package/python-pycrypto/python-pycrypto.hash
+++ b/package/python-pycrypto/python-pycrypto.hash
@@ -1,2 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256	f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c	pycrypto-2.6.1.tar.gz
+sha256  f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c  pycrypto-2.6.1.tar.gz
+# Locally computed
+sha256  15925a98d05c6d086c30943e4eacdbd361bcf76daa109b6e6dfc9d0c4ad9ed64  COPYRIGHT
+sha256  10c41e1aaf84bd3546d1ff7ef89454817744fd2c18cdd80a137e802095448016  LEGAL/copy/LICENSE.libtom
+sha256  253a271c681cd4b3f9503659fe754ee305efe68ebb6e8733b7f436d73845a32c  LEGAL/copy/LICENSE.python-2.2
+sha256  96f9a25274a59843715a26986e4a2427c312a1d86b9207f26fcafcea47a417fe  LEGAL/copy/LICENSE.original
diff --git a/package/python-pygame/python-pygame.hash b/package/python-pygame/python-pygame.hash
new file mode 100644
index 0000000000..c0496515e2
--- /dev/null
+++ b/package/python-pygame/python-pygame.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe  pygame-d61ea8eabd56.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  LGPL
diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index b0d75fd0be..a6ddeb24a6 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/PyICU/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/PyICU/json
 md5 7656f5cc53a7c18b40e653d6eefdee14   PyICU-1.9.7.tar.gz
-sha256 db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
+# Locally computed
+sha256  db27cd1cc150b879c5465872bec7fdaf340eca140aa922be03891d5b9f855b61  PyICU-1.9.7.tar.gz
+sha256  74bbadee4ee3c3a1ac0ecfbd74bc7ce64046de1ceddf4717dc923809ca8ffce3  LICENSE
diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
index 2bcf0541d0..72095ff6e5 100644
--- a/package/python-pyinotify/python-pyinotify.hash
+++ b/package/python-pyinotify/python-pyinotify.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
+sha256  7943f198c5cef2bdc121d847937fbe565daaa7d4daaf1b8de8ef5689812f481c  python-pyinotify-0.9.6.tar.gz
+sha256  97c96d577f761e23c7778bda2b163dba7b94e4defdd7873b7155bed252820608  COPYING
diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index 0bca6e6d2c..61960f469d 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-3.11.0.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/python-pypcap/python-pypcap.hash b/package/python-pypcap/python-pypcap.hash
index 30ddfab411..40db6b4f33 100644
--- a/package/python-pypcap/python-pypcap.hash
+++ b/package/python-pypcap/python-pypcap.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  5716d97b39d40b79daf7b0c6a8c8c514f5f1de8f20561c8621ee62a90b93fb03  python-pypcap-6f46e7bf29a648256ddc732a7d0ec83d3ffca390.tar.gz
+sha256  48306c284fdbdf836b880528c3bdd658deac47ed78ffeb24a4ca5a8c39a39304  LICENSE
diff --git a/package/python-pyqrcode/python-pyqrcode.hash b/package/python-pyqrcode/python-pyqrcode.hash
index 619ddb0cc4..b54b4aad27 100644
--- a/package/python-pyqrcode/python-pyqrcode.hash
+++ b/package/python-pyqrcode/python-pyqrcode.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyqrcode/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pyqrcode/json
 md5	371f29f4b03bd2830c6e0319258b1259  PyQRCode-1.2.1.tar.gz
+# Locally computed
 sha256	fdbf7634733e56b72e27f9bce46e4550b75a3a2c420414035cae9d9d26b234d5  PyQRCode-1.2.1.tar.gz
+sha256  bef0c3595451da5132dea99e288fb5dafcbc469e0643f993a4ba0a69980f5ec9  setup.py
diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
index f3f29a39a8..91738321a9 100644
--- a/package/python-pyratemp/python-pyratemp.hash
+++ b/package/python-pyratemp/python-pyratemp.hash
@@ -1,4 +1,5 @@
 #md5 from https://pypi.python.org/pypi?:action=show_md5&digest=e4bbe5d4a98016efef882b2b2f47defb
 md5     e4bbe5d4a98016efef882b2b2f47defb pyratemp-0.3.2.tgz
 # Locally calculated:
-sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
+sha256  c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71  pyratemp-0.3.2.tgz
+sha256  3de57a97f9c8492808867ae2ac2b33b422a8a34d29d0ea981b9e85c0963462db  LICENSE
diff --git a/package/python-pyrex/python-pyrex.hash b/package/python-pyrex/python-pyrex.hash
index 607d30360b..e8963558fc 100644
--- a/package/python-pyrex/python-pyrex.hash
+++ b/package/python-pyrex/python-pyrex.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50	Pyrex-0.9.9.tar.gz
+sha256  5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50  Pyrex-0.9.9.tar.gz
+sha256  5c1aec55fc8c399ec23968ddb2117eec8f7a53f002c15472a8b0aa7426790700  LICENSE.txt
diff --git a/package/python-pyro/python-pyro.hash b/package/python-pyro/python-pyro.hash
index 4db42efea3..c22b66ddc4 100644
--- a/package/python-pyro/python-pyro.hash
+++ b/package/python-pyro/python-pyro.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyro/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pyro/json
 md5 59d4d3f4a8786776c9d7f9051b8f1a69 Pyro-3.16.tar.gz
+# Locally computed
 sha256 1bed508453ef7a7556b51424a58101af2349b662baab7e7331c5cb85dbe7e578 Pyro-3.16.tar.gz
+sha256  7c14017a2f543384bfcde86043758b68d023b47bf09700a7df6dacbae9c82103  LICENSE
diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
index 755be50364..d1aff6aed2 100644
--- a/package/python-pysendfile/python-pysendfile.hash
+++ b/package/python-pysendfile/python-pysendfile.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
+sha256  259f433563cfe0296c84c00381c600e82e0ab1b617ce20fe6e7f555a2b95af26  LICENSE
diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index 952466701d..94ff33ea31 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysmb/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pysmb/json
 md5 e6f9ce0032db528aae060f7019bd409c pysmb-1.1.19.tar.gz
-sha256 fa4e6b4a4f2afbfbd71e9179c491f8c77bc2ad19e0bc866d7c6cbfa9ae272602 pysmb-1.1.19.tar.gz
+# Locally computed
+sha256  fa4e6b4a4f2afbfbd71e9179c491f8c77bc2ad19e0bc866d7c6cbfa9ae272602  pysmb-1.1.19.tar.gz
+sha256  2b1a0a56543c1bda07f5583dddaf544442c139d3f46747d4700c7031ef354c14  LICENSE
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 8deb2e530e..22d8dcb47e 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
 md5	01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
+# Locally computed
 sha256	00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
+sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
index adda9a4d25..94c590731b 100644
--- a/package/python-pyudev/python-pyudev.hash
+++ b/package/python-pyudev/python-pyudev.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=07a60f5f7a6028e83725f759a1b9490a, sha256 locally computed
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=07a60f5f7a6028e83725f759a1b9490a
 md5     07a60f5f7a6028e83725f759a1b9490a  pyudev-0.18.tar.gz
+# Locally computed
 sha256  83b315f74e29c3a4aa6ea38b6cf73b0bb7e37066d7a5d70972ac418a80aed62a  pyudev-0.18.tar.gz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index 098d08f751..c5006c8184 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyusb/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/pyusb/json
 md5     c8a571bfdba778555156af3facaea6fc PyUSB-1.0.0.tar.gz
+# Locally computed
 sha256  5b34ffa74ac34f330bff949c94ee00ec4a9d147234db17ee2eed2a67c0275368  PyUSB-1.0.0.tar.gz
+sha256  de177fb928a0eed8d209fddbfa3861379e08b3b41f34ad17a329c2f78199371d  LICENSE
diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index 03a5344c25..620efd27ad 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -2,3 +2,5 @@
 # sha256 from https://pypi.python.org/pypi/rpi_gpio/json
 md5 777617f9dea9a1680f9af43db0cf150e RPi.GPIO-0.7.0.tar.gz
 sha256 7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f RPi.GPIO-0.7.0.tar.gz
+# Locally computed
+sha256  a668b3edecb3e69e81ec25987257008208ffcba9d6c43682033b8060c5f2f994  LICENCE.txt
diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 80f4450fd9..f67231d398 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-2.1.fb57.tar.gz
+sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index bf4d960358..6bade7bba7 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2dcdd1b761700a5a13252fea3dfd1977, sha256 locally computed.
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2dcdd1b761700a5a13252fea3dfd1977
 md5	2dcdd1b761700a5a13252fea3dfd1977  setproctitle-1.1.10.tar.gz
+# Locally computed
 sha256	6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398  setproctitle-1.1.10.tar.gz
+sha256  40e85df0511ccacd29b6b5898e7e09b76889fc2f5d94b2670ece847977d3bbed  COPYRIGHT
diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index cbc6745bd9..cc9ba214b8 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/sh/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/sh/json
 md5 a8351aef25d25f707c17e0a7a6280251 sh-1.12.14.tar.gz
-sha256 b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc sh-1.12.14.tar.gz
+# Locally computed
+sha256  b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc  sh-1.12.14.tar.gz
+sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-singledispatch/python-singledispatch.hash b/package/python-singledispatch/python-singledispatch.hash
index 8a96d21a95..c4eec53e30 100644
--- a/package/python-singledispatch/python-singledispatch.hash
+++ b/package/python-singledispatch/python-singledispatch.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=af2fc6a3d6cc5a02d0bf54d909785fcb, sha256 locally computed
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=af2fc6a3d6cc5a02d0bf54d909785fcb
 md5     af2fc6a3d6cc5a02d0bf54d909785fcb singledispatch-3.4.0.3.tar.gz
+# Locally computed
 sha256  5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c  singledispatch-3.4.0.3.tar.gz
+sha256  5a724c436f88585973787af91cecf58503cbf09e5c1721c516880614700767ef  setup.py
diff --git a/package/python-slob/python-slob.hash b/package/python-slob/python-slob.hash
index 39d5d81f30..5bce1f1326 100644
--- a/package/python-slob/python-slob.hash
+++ b/package/python-slob/python-slob.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 18eb4f45d09d49b1f776cac52ea70ab951566c60cd30bbec39e88f10908fd8ff  python-slob-31ad0e769360a5b10a4893f686587bb8e48c3895.tar.gz
+sha256  18eb4f45d09d49b1f776cac52ea70ab951566c60cd30bbec39e88f10908fd8ff  python-slob-31ad0e769360a5b10a4893f686587bb8e48c3895.tar.gz
+sha256  db09bc6733ab28dc59bfbcd01819feb9d05241cbef3ca3f5f58ec739b341d56f  LICENSE
diff --git a/package/python-smbus-cffi/python-smbus-cffi.hash b/package/python-smbus-cffi/python-smbus-cffi.hash
index 1e28df99b7..ed851eb6fa 100644
--- a/package/python-smbus-cffi/python-smbus-cffi.hash
+++ b/package/python-smbus-cffi/python-smbus-cffi.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f621c871bd658ee665751ad78e3b2df9, sha256 locally computed
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f621c871bd658ee665751ad78e3b2df9
 md5     f621c871bd658ee665751ad78e3b2df9  smbus-cffi-0.5.1.tar.gz
+# Locally computed
 sha256  fb4195aaabfc01586863f60d3190b5cb1bf8f12622fd597e23e48768dad6bde8  smbus-cffi-0.5.1.tar.gz
+sha256  d54f57bf73bd1ff19a424b6deab6ff08f6089a2469c8de360b167f755e4ecb4c  LICENSE
diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index ae480b8fe8..1e5cee5cec 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/systemd-python/, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/systemd-python/
 md5 5071ea5bcb976186e92a3f5e75df221d systemd-python-234.tar.gz
-sha256 fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7 systemd-python-234.tar.gz
+# Locally computed
+sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-tomako/python-tomako.hash b/package/python-tomako/python-tomako.hash
index af07a88abc..65576f4196 100644
--- a/package/python-tomako/python-tomako.hash
+++ b/package/python-tomako/python-tomako.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/tomako/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/tomako/json
 md5	a2e9e99be4ddf2263ed441ddc3dfcf96  tomako-0.1.0.post1.tar.gz
+# Locally computed
 sha256	2d8ec113199408eb16ec00361aac6f10b716925779b6331083f304d01dafd150  tomako-0.1.0.post1.tar.gz
+sha256  2b55167354e331f089d5f7a9a9ef4149b0baa95abd6860b6390a04001e1f2bb8  LICENSE
diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 9ecac881e2..03f7aef2e5 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/typepy/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/typepy/json
 md5	b9abd4d661dabe512e95ca69ddb65d55  typepy-0.0.20.tar.gz
+# Locally computed
 sha256	a1a5b9438670d4a5d9f882b7499ea85d06dc384577bb7636cb29d903288bca8c  typepy-0.0.20.tar.gz
+sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index a3ab50faed..07ce8508ac 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/wcwidth/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/wcwidth/json
 md5	b3b6a0a08f0c8a34d1de8cf44150a4ad	wcwidth-0.1.7.tar.gz
-sha256	3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e	wcwidth-0.1.7.tar.gz
+# Locally computed
+sha256  3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e  wcwidth-0.1.7.tar.gz
+sha256  0eddcc52cd3ef5d30798b8d43a14d3f0f1dcf0a6e4c1d0f2e177c44ce85bb69c  LICENSE.txt
diff --git a/package/python-whoosh/python-whoosh.hash b/package/python-whoosh/python-whoosh.hash
index 0621a2a2d2..c615beb9c3 100644
--- a/package/python-whoosh/python-whoosh.hash
+++ b/package/python-whoosh/python-whoosh.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/whoosh/json, sha256 locally computed
+# md5 from https://pypi.python.org/pypi/whoosh/json
 md5 c2710105f20b3e29936bd2357383c325 Whoosh-2.7.4.tar.gz
-sha256 7ca5633dbfa9e0e0fa400d3151a8a0c4bec53bd2ecedc0a67705b17565c31a83 Whoosh-2.7.4.tar.gz
+# Locally computed
+sha256  7ca5633dbfa9e0e0fa400d3151a8a0c4bec53bd2ecedc0a67705b17565c31a83  Whoosh-2.7.4.tar.gz
+sha256  464ef68037a0e5545e4716b4ff99f3f85ca89cf9e9a7ecfd7a02039ba1c34a90  LICENSE.txt
diff --git a/package/python-xlutils/python-xlutils.hash b/package/python-xlutils/python-xlutils.hash
index 4f99860cb6..aa507883a6 100644
--- a/package/python-xlutils/python-xlutils.hash
+++ b/package/python-xlutils/python-xlutils.hash
@@ -2,3 +2,5 @@
 md5	7a6a339ddaacabce244341582ee61353  xlutils-2.0.0.tar.gz
 # sha256 calculated by scanpypi
 sha256	7e0e2c233bd185fecf5e2bd3f4e9469ca4a3bd87da64c82cfe5b2af27e7f9e54  xlutils-2.0.0.tar.gz
+# Locally computed
+sha256  28907976ee86414cc720fafc966563b16eeb6a6aeb1da5f5ed40bac3a8808bcf  xlutils/license.txt
diff --git a/package/python-xlwt/python-xlwt.hash b/package/python-xlwt/python-xlwt.hash
index 7e4c992b13..8b0511fdae 100644
--- a/package/python-xlwt/python-xlwt.hash
+++ b/package/python-xlwt/python-xlwt.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlwt/json
 md5	4b1ca8a3cef3261f4b4dc3f138e383a8  xlwt-1.3.0.tar.gz
 sha256	c59912717a9b28f1a3c2a98fd60741014b06b043936dcecbc113eaaada156c88  xlwt-1.3.0.tar.gz
+# Locally computed
+sha256  7f7b66f23fdac4f68fe3b342dd16b329d511017a901784a5ceb83f505f2de7c6  docs/licenses.rst
-- 
2.20.1
