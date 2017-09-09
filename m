From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:42:17 +0200
Subject: [Buildroot] [git commit] package/terminology: bump to v1.1.1
Message-ID: <20170909203456.00A7D7FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a834b86ee0a9396ec2698aaf69547ff8db500b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/enlightenment/mailman/message/36026490

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index c203226..81ae5d8 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	eb9136e487ab9e6ff3c98173919b5ad105626434d096dafecd18392fc40c348f	terminology-1.1.0.tar.xz
+# From https://sourceforge.net/p/enlightenment/mailman/message/36026490/
+sha256	da12b8a24ca5248b2d292d9b1e19cabc61ae29b21f96d4b6f4f3e7b4feeecc16	terminology-1.1.1.tar.xz
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 817521d..ed811b3 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.1.0
+TERMINOLOGY_VERSION = 1.1.1
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
