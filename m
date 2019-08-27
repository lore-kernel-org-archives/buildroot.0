From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Tue, 27 Aug 2019 11:16:36 +0200
Subject: [Buildroot] [PATCH] package/tinc: upgrade to 1.0.36
Message-ID: <20190827091636.9024-1-zgyarmati@zgyarmati.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/tinc/tinc.hash | 2 +-
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 0daeb324e9..c9ca2a9e8f 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  18c83b147cc3e2133a7ac2543eeb014d52070de01c7474287d3ccecc9b16895e tinc-1.0.35.tar.gz
+sha256  40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108 tinc-1.0.36.tar.gz
 sha256  3a112fd37b47d624e89b130d0e158bb8d14ec5bc9ecf5f18b448d2c07626e43d COPYING
 sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index ae7ce97bfa..56a26e9a55 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.35
+TINC_VERSION = 1.0.36
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
-- 
2.17.1
