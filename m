From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:51 +0100
Subject: [Buildroot] [PATCH 01/32] package/a*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/at91bootstrap3/at91bootstrap3.hash            | 1 +
 package/adwaita-icon-theme/adwaita-icon-theme.hash | 6 +++++-
 package/aer-inject/aer-inject.hash                 | 3 ++-
 package/alsamixergui/alsamixergui.hash             | 2 ++
 package/am335x-pru-package/am335x-pru-package.hash | 3 ++-
 package/am33x-cm3/am33x-cm3.hash                   | 3 ++-
 package/android-tools/android-tools.hash           | 1 +
 package/atkmm/atkmm.hash                           | 5 ++++-
 package/avrdude/avrdude.hash                       | 3 ++-
 package/axfsutils/axfsutils.hash                   | 3 ++-
 10 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.hash b/boot/at91bootstrap3/at91bootstrap3.hash
index b2ad6241db..9f6c95ab08 100644
--- a/boot/at91bootstrap3/at91bootstrap3.hash
+++ b/boot/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	e23e6df23b79ca81e412cb73a1f48bd95df8d46c7d52a1d073c2ed9d4f3a1a71  at91bootstrap3-v3.9.0.tar.gz
+sha256  732b2a55b5905031d8ae420136ffb5f8889214865784386bf754cffab8d2bc6e  main.c
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index 61b5f14d25..0daef24db5 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,2 +1,6 @@
 # From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
-sha256	c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7	adwaita-icon-theme-3.22.0.tar.xz
+sha256  c18bf6e26087d9819a962c77288b291efab25d0419b73d909dd771716a45dcb7  adwaita-icon-theme-3.22.0.tar.xz
+# locally computed
+sha256  51f83b2b4e9ed2beebc9b8eed2ecad29314a58ed8c5184b22ad8f9df703d3ce5  COPYING
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING_LGPL
+sha256  207fe75c396c0ae197c57d42c727163428b6667d98cef3644e41c6f1afe1895f  COPYING_CCBYSA3
diff --git a/package/aer-inject/aer-inject.hash b/package/aer-inject/aer-inject.hash
index 6329de6df7..ee097c873a 100644
--- a/package/aer-inject/aer-inject.hash
+++ b/package/aer-inject/aer-inject.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 49a44b7a9e3983dc15fdc5bacd0e095df650296024f43f9d6c080ad54de0b07f  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41.tar.gz
+sha256  49a44b7a9e3983dc15fdc5bacd0e095df650296024f43f9d6c080ad54de0b07f  aer-inject-9bd5e2c7886fca72f139cd8402488a2235957d41.tar.gz
+sha256  659a191d8775e05c6c6a9a4ba66b3577c577342bb83f20d393135eb6633c8973  README
diff --git a/package/alsamixergui/alsamixergui.hash b/package/alsamixergui/alsamixergui.hash
index 5cea490a49..85c9ffe75e 100644
--- a/package/alsamixergui/alsamixergui.hash
+++ b/package/alsamixergui/alsamixergui.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui/alsamixergui_0.9.0rc2-1-9.dsc
 md5	af942a41b81ba27e2e4d0a1e1ab0decb  alsamixergui_0.9.0rc2-1.orig.tar.gz
+# locally computed
+sha256  ea617b76dcd0df74576686ca34c281f43bb9d844015cea91e3debc91538d2b1d  debian/copyright
diff --git a/package/am335x-pru-package/am335x-pru-package.hash b/package/am335x-pru-package/am335x-pru-package.hash
index 36671b488a..ad386fe04b 100644
--- a/package/am335x-pru-package/am335x-pru-package.hash
+++ b/package/am335x-pru-package/am335x-pru-package.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 2a902f825ccc1885c5dccd83e1ccee104aa30e601c9964a24f49459f76f674b9 am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096.tar.gz
+sha256  2a902f825ccc1885c5dccd83e1ccee104aa30e601c9964a24f49459f76f674b9  am335x-pru-package-5f374ad57cc195f28bf5e585c3d446aba6ee7096.tar.gz
+sha256  f0fcdf9b2090896389eb4b784f23be96d5544c5ce5282d84f82ae9a8e8331beb  pru_sw/utils/LICENCE.txt
diff --git a/package/am33x-cm3/am33x-cm3.hash b/package/am33x-cm3/am33x-cm3.hash
index bb8c2f665e..a63ba64a3c 100644
--- a/package/am33x-cm3/am33x-cm3.hash
+++ b/package/am33x-cm3/am33x-cm3.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 a722098b362f58f4dfb2a7c30afd604424d435b3d5ebe6ebf5d76ad942f796d0  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365.tar.gz
+sha256  a722098b362f58f4dfb2a7c30afd604424d435b3d5ebe6ebf5d76ad942f796d0  am33x-cm3-11107db2f1e9e58ee75d4fe9cc38423c9a6e4365.tar.gz
+sha256  e136e6949a1d3ca144374375af8b9387faa11d2eee7debff8cf22ca8fe7bf7e9  License.txt
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
index 7afa04430b..27602fb2f7 100644
--- a/package/android-tools/android-tools.hash
+++ b/package/android-tools/android-tools.hash
@@ -1,3 +1,4 @@
 # locally computed
 sha256	9bfba987e1351b12aa983787b9ae4424ab752e9e646d8e93771538dc1e5d932f  android-tools_4.2.2+git20130218.orig.tar.xz
 sha256	73c3078de3e44d8a3cadf7a360863c63155d9d558c2f0933cf38ad901a3f5998  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
+sha256  170c5939bf8c8eed1db8f66f2d6155e8c1a3e799e390b55e7aad253195b1ebf5  debian/copyright
diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 4b3577c88d..42cc2d7221 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.sha256sum
-sha256	ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd	atkmm-2.24.2.tar.xz
+sha256  ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd  atkmm-2.24.2.tar.xz
+# locally computed
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index b203d4d100..888668ae44 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
+sha256  cfa97af7badc713c62306ab85d0e7a288b064bf72e698494f73cb16c5b2c659e  avrdude-f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa.tar.gz
+sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  avrdude/COPYING
diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
index 3ef5c5876f..b7a5943ddb 100644
--- a/package/axfsutils/axfsutils.hash
+++ b/package/axfsutils/axfsutils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 7d8c0febaf6f104c2b179475ea1ee6d361688ad7fa4c98dfdf7395fcff2be685 axfsutils-384a1ea214c8cf8359faba00a12513ee7ae1a9f5.tar.gz
+sha256  7d8c0febaf6f104c2b179475ea1ee6d361688ad7fa4c98dfdf7395fcff2be685  axfsutils-384a1ea214c8cf8359faba00a12513ee7ae1a9f5.tar.gz
+sha256  1929a1e67d189aa3a24de76255841b33818f7f65944b6e73a1568ba575ab54d5  mkfs.axfs-legacy/COPYING
-- 
2.20.1
