From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 May 2009 22:49:06 +0200
Subject: [Buildroot] [git commit] busybox: fix brown paper bag typo
	introduced in a7ed91a
Message-ID: <20090526205143.93E9B7780F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8843ded099782497029c1848bb1c1c161255f7a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4f1d038..fcec41a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -92,7 +92,7 @@ endif
 
 
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
-q	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
+	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
 		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
-- 
1.6.0.6
