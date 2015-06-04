From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 15:35:22 +0200
Subject: [Buildroot] [git commit] configs/qemu: update mips* malta
	configurations
Message-ID: <20150604133646.148FF80136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4d666beae250e5c702bb6c2a0d48665b4cc90e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable USB UHCI to be able to use usb mouse emulation for graphic
application tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/mips-malta/linux-4.0.config     |    2 ++
 board/qemu/mips64-malta/linux-4.0.config   |    2 ++
 board/qemu/mips64el-malta/linux-4.0.config |    2 ++
 board/qemu/mipsel-malta/linux-4.0.config   |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/board/qemu/mips-malta/linux-4.0.config b/board/qemu/mips-malta/linux-4.0.config
index 60fcd70..3a26ac8 100644
--- a/board/qemu/mips-malta/linux-4.0.config
+++ b/board/qemu/mips-malta/linux-4.0.config
@@ -23,6 +23,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64-malta/linux-4.0.config b/board/qemu/mips64-malta/linux-4.0.config
index 9b5d4e6..cd0b560 100644
--- a/board/qemu/mips64-malta/linux-4.0.config
+++ b/board/qemu/mips64-malta/linux-4.0.config
@@ -27,6 +27,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64el-malta/linux-4.0.config b/board/qemu/mips64el-malta/linux-4.0.config
index 8877a2e..c6b46d4 100644
--- a/board/qemu/mips64el-malta/linux-4.0.config
+++ b/board/qemu/mips64el-malta/linux-4.0.config
@@ -28,6 +28,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mipsel-malta/linux-4.0.config b/board/qemu/mipsel-malta/linux-4.0.config
index b9a743f..79d7352 100644
--- a/board/qemu/mipsel-malta/linux-4.0.config
+++ b/board/qemu/mipsel-malta/linux-4.0.config
@@ -24,6 +24,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
