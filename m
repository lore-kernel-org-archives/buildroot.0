From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 10:44:47 +0100
Subject: [Buildroot] [git commit] linux: drop LZMA environment variable
Message-ID: <20120210103340.561058C584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b911b583ad473cfac19297edd76852338901fec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not used anymore.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index dbe1ad7..ae236d4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -40,7 +40,6 @@ LINUX_MAKE_FLAGS = \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	LZMA="$(LZMA)" \
 	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
 
 # Get the real Linux version, which tells us where kernel modules are
