From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 00:07:01 +0200
Subject: [Buildroot] [git commit] libressl: bump version to 2.5.5
Message-ID: <20170715065322.B2CA481EB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c0fb459c6c581b7c7f8ea823770707f8f092719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9ffe964..580701d 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,2 +1,2 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256	107a5b522fbb8318d4c3be668075e5e607296f0a9255d71674caa94571336efa	libressl-2.5.4.tar.gz
+sha256	e57f5e3d5842a81fe9351b6e817fcaf0a749ca4ef35a91465edba9e071dce7c4	libressl-2.5.5.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 6941447..ccd236d 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.5.4
+LIBRESSL_VERSION = 2.5.5
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
