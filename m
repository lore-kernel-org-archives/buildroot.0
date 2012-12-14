From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Dec 2012 08:53:47 +0100
Subject: [Buildroot] [git commit] qemu: fix QEMU_USER variable
Message-ID: <20121214075403.094EB9A10B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45eda5a15cd8e5b8d4fabfbeac45776eec51fc8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Fran??ois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 3c01102..8d07807 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -89,4 +89,4 @@ endef
 $(eval $(host-generic-package))
 
 # variable used by other packages
-QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(QEMU_ARCH)
+QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
