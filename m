From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Apr 2011 15:12:19 +0200
Subject: [Buildroot] [git commit] qemu/arm-versatile: enable tmpfs support
	in kernel
Message-ID: <20110422132109.BAE9582973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8071f81f3de49b4f1e7d10dcdc3d9fda09f0b6f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for /tmp.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/arm-versatile/linux-2.6.36.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-2.6.36.config b/board/qemu/arm-versatile/linux-2.6.36.config
index ac58e1a..597fd23 100644
--- a/board/qemu/arm-versatile/linux-2.6.36.config
+++ b/board/qemu/arm-versatile/linux-2.6.36.config
@@ -69,6 +69,7 @@ CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=m
 CONFIG_EXT2_FS=y
 CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=y
-- 
1.7.3.4
