From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jun 2020 22:57:53 +0200
Subject: [Buildroot] [git commit] package/libresslL: bump version to 3.1.2
Message-ID: <20200604205729.33BBA82926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9769585638f78a43d1fe8a2a6c2fe03524b8a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index fcecc2b434..6b53d54e45 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 df7b172bf79b957dd27ef36dcaa1fb162562c0e8999e194aa8c1a3df2f15398e  libressl-3.0.2.tar.gz
+sha256  f88a2f7ea617149a34e40c022d9912963f00eaa6109af421317525e6c978d892  libressl-3.1.2.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index c2491bb3a9..c703076268 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.0.2
+LIBRESSL_VERSION = 3.1.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
