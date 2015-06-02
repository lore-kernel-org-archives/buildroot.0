From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:44:08 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.5.5
Message-ID: <20150602205021.1853A80187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bdbf14973d8bc0a9e08888c073ca6587961c3d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 50e2e7b..64d2fac 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.4.tar.xz.asc
-md5	5b53d5bb47fa033b76857f7956d0c36b	squid-3.5.4.tar.xz
-sha1	71a04a5f7c4c38464a8a08ae1089c47abcea0e49	squid-3.5.4.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.5.tar.xz.asc
+md5	9a323a97753143ddd935aed58a0193ae	squid-3.5.5.tar.xz
+sha1	2c168e8b13251ed8050d9e780127c4de016dcb61	squid-3.5.5.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 745c9ad..3d0f4d8 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).4
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).5
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
