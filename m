From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 17:28:01 -0500
Subject: [Buildroot] [PATCH] less: bump version to 444
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE9E4@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

less-444 was released on 9 Jun 2011.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/package/less/less.mk b/package/less/less.mk
index d20c232..5f74f5c 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LESS_VERSION = 443
+LESS_VERSION = 444
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_DEPENDENCIES = ncurses
 
