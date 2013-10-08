From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 08 Oct 2013 09:31:48 +0800
Subject: [Buildroot] [PATCH] lvm2: bump to version 2.02.103 and add license
	information
Message-ID: <1381195908.12897.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/lvm2/lvm2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 873216c..07c0d94 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.79
+LVM2_VERSION = 2.02.103
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
+LVM2_LICENSE = GPLv2+ LGPLv2.1+
+LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 LVM2_BINS = \
 	dmsetup fsadm lvm lvmconf lvmdump vgimportclone \
-- 
1.8.1.2
