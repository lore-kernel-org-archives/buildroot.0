From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 16:51:47 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.5.22
Message-ID: <20161014145259.BF95C7F995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d391ed8b7a4751a3efe9453e81de373ae85a745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 30eed50..3b2f2de 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.21.tar.xz.asc
-md5 e6745a6e4ac0b48b7283861f64a40ae5  squid-3.5.21.tar.xz
-sha1 38c4f801a17e27ea530fef88c6ee24b42f08529c  squid-3.5.21.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.22.tar.xz.asc
+md5 afb82d2748c06c95815c171463b4aa14  squid-3.5.22.tar.xz
+sha1 73e9199dd9d2a7f107f78d03454830713a4a571d  squid-3.5.22.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c8a7248..ddd0b83 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).21
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).22
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
