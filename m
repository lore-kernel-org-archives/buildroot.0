From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 13:07:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/proftpd: bump version to 1.3.5a
Message-ID: <1454242055-9404-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/proftpd/proftpd.hash | 6 ++++--
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 183e824..288e917 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,2 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256	c198b53991ce641eae6b3237e856e59f0bfe8330794145b49cae33f85b6f5370	proftpd-1.3.4d.tar.gz
+# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5a.tar.gz.md5
+md5	b9d3092411478415b31d435f8e26d173	proftpd-1.3.5a.tar.gz
+# Locally calculated
+sha256	a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67fae5696	proftpd-1.3.5a.tar.gz
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d040b8c..3af8b89 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.4d
+PROFTPD_VERSION = 1.3.5a
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
-- 
2.7.0
