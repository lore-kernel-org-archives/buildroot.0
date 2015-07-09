From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:22:16 +0200
Subject: [Buildroot] [git commit] qemu/configs: enable DRM+QXL for x86 and
	x86_64
Message-ID: <20150709202222.B4BF98082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68152fea9b30a58c520c1501c0fdd33e13e16a1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allows for nicer framebuffer emulation under Qemu with the QXL xorg
driver.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/linux-4.1.config    |    2 ++
 board/qemu/x86_64/linux-4.1.config |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/board/qemu/x86/linux-4.1.config b/board/qemu/x86/linux-4.1.config
index ce19f81..5b64416 100644
--- a/board/qemu/x86/linux-4.1.config
+++ b/board/qemu/x86/linux-4.1.config
@@ -18,3 +18,5 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
diff --git a/board/qemu/x86_64/linux-4.1.config b/board/qemu/x86_64/linux-4.1.config
index ce19f81..5b64416 100644
--- a/board/qemu/x86_64/linux-4.1.config
+++ b/board/qemu/x86_64/linux-4.1.config
@@ -18,3 +18,5 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
