From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 14:46:39 +0200
Subject: [Buildroot] [git commit] qemu/x86: enable alsa/hda support in kernel
Message-ID: <20110929190332.8A3DE8DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=946a0ff97a574f2963434bba9c587d4832498bca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For easy sound testing using qemu-system-i386 -soundhw hda

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/x86/linux-3.0.config |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/board/qemu/x86/linux-3.0.config b/board/qemu/x86/linux-3.0.config
index 20ef541..5bf6944 100644
--- a/board/qemu/x86/linux-3.0.config
+++ b/board/qemu/x86/linux-3.0.config
@@ -46,6 +46,9 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 # CONFIG_MFD_SUPPORT is not set
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
 # CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_X86_PLATFORM_DEVICES is not set
