From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Sep 2015 17:43:43 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.8
Message-ID: <1442004223-19430-1-git-send-email-gustavo@zacarias.com.ar>
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
index 472df2d..97205e3 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.7.tar.xz.asc
-md5	e24943386555ca922130a7e034badba7	squid-3.5.7.tar.xz
-sha1	e7dcc0cbcee6fd10a8c8bf3e9bff0dc6359ccc48	squid-3.5.7.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.8.tar.xz.asc
+md5	0b4eae643b009215688fcf5f1a7803a7	squid-3.5.8.tar.xz
+sha1	4ba4b43cf9abaf7e5015ad4d2d9b628213e55044	squid-3.5.8.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e8fd079..75a2d35 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).7
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.4.6
