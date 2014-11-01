From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:45:58 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.4.9
Message-ID: <20141101134604.5290FB27AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9966aed04948d230f1c1f3de4faee2762607e210
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 295a0fd..8bc8dbd 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.8.tar.xz.asc
-md5	b0c4335447248810169f58ea4d8b204a	squid-3.4.8.tar.xz
-sha1	e2e20414252f315b2912ae32ac084ea07a48133f	squid-3.4.8.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.9.tar.xz.asc
+md5	497e5be7b3430d12667628296760beca	squid-3.4.9.tar.xz
+sha1	7d652e2f3794e15302d36700a167f16d24ad6cd5	squid-3.4.9.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 041df17..e8a2ccc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).9
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
