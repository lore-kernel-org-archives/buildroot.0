From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 17:31:57 +0100
Subject: [Buildroot] [PATCH 7/7] pixman: bump version to 0.18.0
In-Reply-To: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
References: <1271262717-2253-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1271262717-2253-8-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/pixman/pixman.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8c7a233..ba77912 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,10 +3,10 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.6
+PIXMAN_VERSION = 0.18.0
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
-PIXMAN_AUTORECONF = NO
+PIXMAN_LIBTOOL_PATCH = NO
 PIXMAN_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,pixman))
-- 
1.7.0
