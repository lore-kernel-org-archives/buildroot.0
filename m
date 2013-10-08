From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:54:45 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.103 and add
	license information
Message-ID: <20131008205535.CD5559B989@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=637421c51f854414c8ecbaf047d1bddd2ac411cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is explictly GPLv2 LGPLv2.1 (not +)]
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 873216c..79a0d05 100644
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
+LVM2_LICENSE = GPLv2 LGPLv2.1
+LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 LVM2_BINS = \
 	dmsetup fsadm lvm lvmconf lvmdump vgimportclone \
