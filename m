From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:23:17 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libressl: bump to
 version 2.9.2
Message-ID: <20190624192315.AD1828694A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4a45097673f020c47c7a62b8c3a061edf0934e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b93c71c83dd4dd5422c8cb258e97b4f08fb1a42a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9e5cbf22e9..e3e5dbe00b 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 39e4dd856694dc10d564201e4549c46d2431601a2b10f3422507e24ccc8f62f8  libressl-2.9.1.tar.gz
+sha256 c4c78167fae325b47aebd8beb54b6041d6f6a56b3743f4bd5d79b15642f9d5d4  libressl-2.9.2.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 4e9796d3ab..2d0f6fc50f 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.9.1
+LIBRESSL_VERSION = 2.9.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
