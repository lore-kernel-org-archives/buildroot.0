From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 23:39:49 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libressl: bump to
 version 3.1.4
Message-ID: <20201213222537.BB99A83E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=420fa7ecc7ba81ed57218c48240c95ad6938f11d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.1.4-relnotes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d226d30286f23c115a34213c5f2f5a247a9bc69a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 957af1e32c..eb784868a8 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  c76b0316acf612ecb62f5cb014a20d972a663bd9e40abf952a86f3b998b69fa0  libressl-3.1.3.tar.gz
+sha256  414c149c9963983f805a081db5bd3aec146b5f82d529bb63875ac941b25dcbb6  libressl-3.1.4.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index dad119a041..06b7174c5e 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.1.3
+LIBRESSL_VERSION = 3.1.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
