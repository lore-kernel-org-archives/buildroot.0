From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:20 +0200
Subject: [Buildroot] [git commit] linux: remove now-redundant ccache handling
Message-ID: <20151004162325.0604281D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=546a69db66abefa7f4d4b880242e84c5026930e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bbcc54b..2319576 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -67,7 +67,7 @@ LINUX_MAKE_FLAGS = \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
 LINUX_MAKE_ENV = \
