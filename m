From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 07:34:18 +0100
Subject: [Buildroot] [git commit] qemu/x86: enable generic hda codec
Message-ID: <20151027063429.5FBDE80064@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44bff8962c20097af646607d9fda5f5c1f09e1e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the generic hda (sound) codec, necessary for qemu audio to work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/linux-4.2.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/board/qemu/x86/linux-4.2.config b/board/qemu/x86/linux-4.2.config
index 5b64416..20726c3 100644
--- a/board/qemu/x86/linux-4.2.config
+++ b/board/qemu/x86/linux-4.2.config
@@ -15,6 +15,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
