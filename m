From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Sep 2015 19:24:29 -0300
Subject: [Buildroot] [PATCH] libtasn1: bump to version 4.6
Message-ID: <1442010269-372-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtasn1/libtasn1.hash | 2 +-
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 653e018..41e10a6 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	89b3b5dce119273431544ecb305081f3530911001bb12e5d76588907edb71bda	libtasn1-4.5.tar.gz
+sha256	3462fc25e2d2536878c39a8825f5e36ba2e2611b27ef535e064f4c56258e508b	libtasn1-4.6.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index eeff76c..6818f30 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.5
+LIBTASN1_VERSION = 4.6
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.4.6
