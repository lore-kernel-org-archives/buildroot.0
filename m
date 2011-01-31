From: Martin Hicks <mort@bork.org>
Date: Mon, 31 Jan 2011 15:28:50 -0500
Subject: [Buildroot] [PATCH] Fix LVM2 compile
Message-ID: <1296505730-9805-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old version doesn't seem to exist for download.

Signed-off-by: Martin Hicks <mort@bork.org>
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
1.5.6.5
