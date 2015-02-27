From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Fri, 27 Feb 2015 03:07:10 -0500
Subject: [Buildroot] [PATCH] psplash: bump version
Message-ID: <1425024430-21477-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version fixes an image rendering bug and adds configuration items.

Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/psplash/psplash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index b756266..5901547 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = afd4e228c606a9998feae44a3fed4474803240b7
+PSPLASH_VERSION = 14c8f7b705de944beb4de3f296506d80871e410f
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPLv2+
 PSPLASH_AUTORECONF = YES
-- 
2.1.0
