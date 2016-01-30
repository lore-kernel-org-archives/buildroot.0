From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 30 Jan 2016 10:24:23 -0300
Subject: [Buildroot] [PATCH] nettle: bump to version 3.2
Message-ID: <1454160263-14576-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nettle/nettle.hash | 2 +-
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index f506992..6332e13 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c	nettle-3.1.1.tar.gz
+sha256	ea4283def236413edab5a4cf9cf32adf540c8df1b9b67641cfc2302fca849d97	nettle-3.2.tar.gz
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 67ae0a1..c133839 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.1.1
+NETTLE_VERSION = 3.2
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.4.10
