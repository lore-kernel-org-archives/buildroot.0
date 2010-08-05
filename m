From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  5 Aug 2010 18:46:24 +0200
Subject: [Buildroot] [PATCH 1/2] kexec: update to version 2.0.2 and update
	download location
Message-ID: <1281026784-20324-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/kexec/kexec.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 154ebf8..f10b1e0 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,9 +3,9 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.1
+KEXEC_VERSION = 2.0.2
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
-KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
+KEXEC_SITE = http://www.kernel.org/pub/linux/utils/kernel/kexec/
 # no install-strip/install-exec
 KEXEC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.7.0.4
