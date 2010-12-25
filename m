From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sat, 25 Dec 2010 10:10:58 -0600
Subject: [Buildroot] [PATCH] lvm2: bump version to 2.02.79 (.78 was pulled
	by Redhat)
Message-ID: <75941d8a73ea1ee57c01a6ae1259d7e7d31ec17e.1293293449.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/lvm2/lvm2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 5c83d9d..9755392 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -3,7 +3,7 @@
 # lvm2
 #
 #############################################################
-LVM2_VERSION = 2.02.78
+LVM2_VERSION = 2.02.79
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
-- 
1.7.3.2
