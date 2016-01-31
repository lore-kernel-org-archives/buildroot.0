From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:09:08 +0100
Subject: [Buildroot] [git commit] nettle: bump to version 3.2
Message-ID: <20160201224702.4EB2D7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f1581661c72f2f3bd2148c0f0fd681556641886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
