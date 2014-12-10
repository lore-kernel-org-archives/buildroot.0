From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Dec 2014 07:06:15 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.4.10
Message-ID: <1418205975-7390-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8bc8dbd..26ed5af 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.9.tar.xz.asc
-md5	497e5be7b3430d12667628296760beca	squid-3.4.9.tar.xz
-sha1	7d652e2f3794e15302d36700a167f16d24ad6cd5	squid-3.4.9.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.10.tar.xz.asc
+md5	3136edfe9bc2458e725671b0d2455702	squid-3.4.10.tar.xz
+sha1	52fb374fd6293978f8002ae994353fbe75d28a98	squid-3.4.10.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 306b2a3..1224369 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).9
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).10
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.0.4
