From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 06:58:47 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.4.11
Message-ID: <1421229527-836-1-git-send-email-gustavo@zacarias.com.ar>
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
index 26ed5af..bc686c1 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.10.tar.xz.asc
-md5	3136edfe9bc2458e725671b0d2455702	squid-3.4.10.tar.xz
-sha1	52fb374fd6293978f8002ae994353fbe75d28a98	squid-3.4.10.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.11.tar.xz.asc
+md5	e79ddb108d24823da8c1dbc0fc4a31fb	squid-3.4.11.tar.xz
+sha1	7de0949714cda4d3f19073aa846f00768a6f841b	squid-3.4.11.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 403818a..c8d7417 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).10
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.0.5
