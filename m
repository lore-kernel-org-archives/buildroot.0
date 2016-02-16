From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Feb 2016 16:28:02 -0300
Subject: [Buildroot] [PATCH v2] squid: security bump to version 3.5.14
Message-ID: <1455650882-25222-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
SQUID-2016:1 - Remote Denial of service issue in SSL/TLS processing.

CVE-2016-2390 assigned.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Change for v2: promote to security bump, add description

 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 97fb45d..f86c09a 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.13.tar.bz2.asc
-md5	3fccd1c072433bb896374a832f608b7d	squid-3.5.13.tar.bz2
-sha1	9bf3b803752c019cb2ddf15afa20f21fa9d385e3	squid-3.5.13.tar.bz2
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.14.tar.bz2.asc
+md5	d589a2dd8ea8867170cef582e7334442	squid-3.5.14.tar.bz2
+sha1	f6a0262b09f7f463822cbdb50bac8f5dd1213d27	squid-3.5.14.tar.bz2
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f205da2..2b7a9a2 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).13
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).14
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.4.10
