From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Aug 2018 22:04:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinc: bump version to 1.0.34
Message-ID: <20180803200455.767-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit:
http://www.tinc-vpn.org/git/browse?p=tinc;a=commitdiff;h=54b18a85f68652f94ac5ecffbd9d100879ed06ea

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinc/tinc.hash | 4 ++--
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index b0cdde834a..09d2867b16 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	7f6f5dc6444bc651ac635c81f4745bcce581bbd1d45ed60cbdc4ee11bebb10f4 tinc-1.0.33.tar.gz
-sha256  10618781fe68ee0958d627f9f4b279b55eaff6c852f7742bbef64dc470c0077c COPYING
+sha256  c03a9b61dedd452116dd9a8db231545ba08a7c96bce011e0cbd3cfd2c56dcfda tinc-1.0.34.tar.gz
+sha256  3a112fd37b47d624e89b130d0e158bb8d14ec5bc9ecf5f18b448d2c07626e43d COPYING
 sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index 002785307e..85dccdc34e 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.33
+TINC_VERSION = 1.0.34
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
-- 
2.18.0
