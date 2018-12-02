From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] libressl: bump to version 2.8.2
Message-ID: <20181202071555.8D2FD8A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a6297368959902b6a6b868cba232fe2c17df22c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release notes since 2.7.4 at

  https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.0-relnotes.txt
  https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.1-relnotes.txt
  https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.2-relnotes.txt

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 111fe4feed..b0d1928e10 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6  libressl-2.7.4.tar.gz
+sha256 b8cb31e59f1294557bfc80f2a662969bc064e83006ceef0574e2553a1c254fd5  libressl-2.8.2.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 35494c8239..f035f9044e 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.7.4
+LIBRESSL_VERSION = 2.8.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
