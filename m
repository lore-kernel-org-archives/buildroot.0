From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun,  2 Apr 2017 00:25:10 -0300
Subject: [Buildroot] [PATCH] mc: bump version to 4.8.19
Message-ID: <20170402032510.29559-1-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index a8116d02b..cb48f2ea9 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.18.sha256:
-sha256 f7636815c987c1719c4f5de2dcd156a0e7d097b1d10e4466d2bdead343d5bece  mc-4.8.18.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.19.sha256:
+sha256 eb9e56bbb5b2893601d100d0e0293983049b302c5ab61bfb544ad0ee2cc1f2df  mc-4.8.19.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 8139648ca..a032c2f1a 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.18
+MC_VERSION = 4.8.19
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.11.0
