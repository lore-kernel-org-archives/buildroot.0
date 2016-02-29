From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:06:10 +0100
Subject: [Buildroot] [git commit] squid: security bump to version 3.5.15
Message-ID: <20160229220615.5F66E80771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ac9738be9d854235f1a61fc29792e1d86ff103b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
SQUID-2016:2 - Multiple Denial of Service issues in HTTP Response
processing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index f86c09a..106bde6 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.14.tar.bz2.asc
-md5	d589a2dd8ea8867170cef582e7334442	squid-3.5.14.tar.bz2
-sha1	f6a0262b09f7f463822cbdb50bac8f5dd1213d27	squid-3.5.14.tar.bz2
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.15.tar.bz2.asc
+md5	59d6732a4ebd3f63e2164d9847dc37c0	squid-3.5.15.tar.bz2
+sha1	72279380ea94aa731f5cf82f3fb50f9250f1692a	squid-3.5.15.tar.bz2
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2b7a9a2..b4341ba 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).14
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).15
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
