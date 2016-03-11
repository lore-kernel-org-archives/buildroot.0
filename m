From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 09:05:06 -0300
Subject: [Buildroot] [PATCH] proftpd: bump to version 1.3.5b
Message-ID: <1457697906-24157-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/proftpd/proftpd.hash | 6 +++---
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 288e917..0735340 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5a.tar.gz.md5
-md5	b9d3092411478415b31d435f8e26d173	proftpd-1.3.5a.tar.gz
+# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.5b.tar.gz.md5
+md5	f7b8e3a383b34a894c2502db74ccccde	proftpd-1.3.5b.tar.gz
 # Locally calculated
-sha256	a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67fae5696	proftpd-1.3.5a.tar.gz
+sha256	afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d044b4fc8	proftpd-1.3.5b.tar.gz
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 3af8b89..a70f41e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.5a
+PROFTPD_VERSION = 1.3.5b
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.gz
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPLv2+
-- 
2.4.10
