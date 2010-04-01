From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:32 +0100
Subject: [Buildroot] [PATCH 02/16] pixman: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-2-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/pixman/pixman.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 087ab12..8c7a233 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,7 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.4
+PIXMAN_VERSION = 0.17.6
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
-- 
1.7.0
