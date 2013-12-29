From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:33:44 +0100
Subject: [Buildroot] [PATCHv2 0/4] grub/iso9660 improvements
Message-ID: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the v2 of the grub/iso9660 improvements. Changes since v1:

 * Dropped patches that have been applied.

 * Added comments in the menu.lst files that explains when color
   vs. foreground/background are used (Yann)

 * Added link in the splashimage Config.in option help text that
   explains how to generate a splashimage (Yann).

Thanks!

Thomas

Thomas Petazzoni (4):
  linux: enable initrd/initramfs support when cpio rootfs is chosen
  fs/iso9660: add Grub splashscreen support
  grub: align splashscreen handling with iso9660 code
  grub: add web reference that documents how to generate a splashimage

 boot/grub/Config.in   |  6 ++++--
 boot/grub/grub.mk     |  5 ++++-
 boot/grub/menu.lst    | 17 +++++++++++++----
 fs/iso9660/iso9660.mk |  5 +++++
 fs/iso9660/menu.lst   | 11 ++++++++++-
 linux/linux.mk        |  3 ++-
 6 files changed, 38 insertions(+), 9 deletions(-)

-- 
1.8.3.2
