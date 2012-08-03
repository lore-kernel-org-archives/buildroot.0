From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  3 Aug 2012 12:48:28 +0100
Subject: [Buildroot] [PATCH] sudo: bump version to 1.8.5p2
Message-ID: <1343994508-22942-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...t-commit-8209:0c4e3f68b2f5-from-upstream.patch} |    0
 package/sudo/sudo.mk                               |    2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/sudo/{sudo-1.8.5p1-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch => sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch} (100%)

diff --git a/package/sudo/sudo-1.8.5p1-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch b/package/sudo/sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
similarity index 100%
rename from package/sudo/sudo-1.8.5p1-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
rename to package/sudo/sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 9b0ebed..00d08f0 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SUDO_VERSION = 1.8.5p1
+SUDO_VERSION = 1.8.5p2
 SUDO_SITE    = http://www.sudo.ws/sudo/dist
 SUDO_CONF_OPT = \
 		--without-lecture \
-- 
1.7.9.5
