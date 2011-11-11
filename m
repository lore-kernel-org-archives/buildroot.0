From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 20:14:22 +0100
Subject: [Buildroot] [git commit] busybox: rename busybox-update to
	busybox-update-config
Message-ID: <20111111191541.ED3E18F4D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96474df156953cc936ef7f8b25cb182089acf885
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original name busybox-update is confusing as it only updates a
configuration file.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9ca4c93..9e91136 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -187,5 +187,5 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-busybox-update:
+busybox-update-config:
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
