From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Sep 2016 11:36:30 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.21
Message-ID: <1473431790-15424-1-git-send-email-gustavo@zacarias.com.ar>
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
index b25a0e0..30eed50 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.20.tar.xz.asc
-md5 48fb18679a30606de98882528beab3a7  squid-3.5.20.tar.xz
-sha1 2bb6d3568e7167c9b99fea092a97287d0e430863  squid-3.5.20.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.21.tar.xz.asc
+md5 e6745a6e4ac0b48b7283861f64a40ae5  squid-3.5.21.tar.xz
+sha1 38c4f801a17e27ea530fef88c6ee24b42f08529c  squid-3.5.21.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7179b33..702b220 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).20
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).21
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.7.3
