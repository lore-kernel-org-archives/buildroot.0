From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 09:59:18 -0300
Subject: [Buildroot] [PATCH] squid: security bump to version 3.5.24
Message-ID: <20170130125918.3599-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
* Mitigate DoS attacks that use client-initiated SSL/TLS renegotiation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index c5251fd..d9b7924 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.23.tar.xz.asc
-md5 9b68f689e3d9578932b9c6a4041037c2  squid-3.5.23.tar.xz
-sha1 33e43869d5eeb0fdfd1d625e6d6edee0617b2b22  squid-3.5.23.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.24.tar.xz.asc
+md5 3fae511e16b6379b61c011914673973d  squid-3.5.24.tar.xz
+sha1 f203637783301a4b86e554b6dd226de721762ae5  squid-3.5.24.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e664122..cf0378a 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).23
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).24
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.10.2
