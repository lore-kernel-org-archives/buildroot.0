From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 18 Dec 2016 10:42:53 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.23
Message-ID: <20161218134253.6594-1-gustavo@zacarias.com.ar>
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
index 3b2f2de..c5251fd 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.22.tar.xz.asc
-md5 afb82d2748c06c95815c171463b4aa14  squid-3.5.22.tar.xz
-sha1 73e9199dd9d2a7f107f78d03454830713a4a571d  squid-3.5.22.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.23.tar.xz.asc
+md5 9b68f689e3d9578932b9c6a4041037c2  squid-3.5.23.tar.xz
+sha1 33e43869d5eeb0fdfd1d625e6d6edee0617b2b22  squid-3.5.23.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index ddd0b83..e664122 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).22
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).23
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.10.2
