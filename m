From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 4 Aug 2011 21:02:44 +0200
Subject: [Buildroot] [PATCH] midori: bump to 0.3.6
Message-ID: <20110804210244.16e688b8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

midori 0.4.0 is out, but requires an additionnal dependency : vala
(maybe a more experienced person could add it?)

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/midori/midori.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 5f6315f..0bf431b 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.3.2
+MIDORI_VERSION = 0.3.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
 MIDORI_INSTALL_TARGET = YES
-- 
1.7.2.3
