From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:00:19 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/usb_modeswitch:
 drop unicode space in comment
Message-ID: <20190129215945.DCB90827FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b1c4cad9a7c5ec53164ca5b0bcd96547abd715f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Commit "a554109af8 package/usb_modeswitch: disable parallel build" added
a unicode space in a comment. Replace it with a normal ASCII space for
consistency with elsewhere.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8be8c72c2ba6cf4c0951e577199e69e91e9f7f3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index bb0d6ab1bf..8b93e086e3 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -10,7 +10,7 @@ USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
 USB_MODESWITCH_LICENSE = GPL-2.0+
 USB_MODESWITCH_LICENSE_FILES = COPYING
-#??Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 USB_MODESWITCH_MAKE = $(MAKE1)
 
 USB_MODESWITCH_BUILD_TARGETS = static
