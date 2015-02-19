From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:30:02 +0100
Subject: [Buildroot] [git commit branch/next] squid: bump to version 3.5.2
Message-ID: <20150219203010.0DEAE80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2dd31aa01312e6ae5f604649c658b9cf21a3731
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 574d462..7d3e3f6 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.1.tar.xz.asc
-md5	b3c9d9726314c1136b7a4c06447db24b	squid-3.5.1.tar.xz
-sha1	a2b01afd33d1df3a234e1a5c3405d626f6cf0fb0	squid-3.5.1.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.2.tar.xz.asc
+md5	0330ec9f69e333c2a81fa4502ba96a22	squid-3.5.2.tar.xz
+sha1	9c546d72df741c9ddaa6da87baa2112503bcbb45	squid-3.5.2.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e385c37..874332f 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).1
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).2
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
