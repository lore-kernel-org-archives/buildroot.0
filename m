From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 20:21:40 +0100
Subject: [Buildroot] [git commit] kexec: bump to version 2.0.4
Message-ID: <20130319192256.67B7E9B19F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9540e4ceebd7e567f79fc68cf019e18dff3aebf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.0.4 has improved support for handling of device-tree
blobs on the ARM platform.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/kexec.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index a8192f7..6510b17 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,8 +3,9 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.3
-KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
+
+KEXEC_VERSION = 2.0.4
+KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
