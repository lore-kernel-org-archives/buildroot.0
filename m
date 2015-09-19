From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 13:58:19 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.5.9
Message-ID: <20150919120021.537AF819AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15809ab132bd3e2c592e67364f0311604843b792
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 97205e3..a67af98 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.8.tar.xz.asc
-md5	0b4eae643b009215688fcf5f1a7803a7	squid-3.5.8.tar.xz
-sha1	4ba4b43cf9abaf7e5015ad4d2d9b628213e55044	squid-3.5.8.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.9.tar.xz.asc
+md5 fe7306a90a0ba2fc906e9a8c741cc8ea  squid-3.5.9.tar.xz
+sha1 4856ca628cafbd1cbfa0ddcbadec440e6f4c2da7  squid-3.5.9.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 75a2d35..641720a 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).9
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
