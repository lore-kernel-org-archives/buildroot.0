From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jan 2015 00:41:03 +0100
Subject: [Buildroot] [git commit] usb_modeswitch_data: bump to version
	20150115
Message-ID: <20150119234523.457467FF0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51bc911a4fc4b9d6ad6684d8ea360fdb8449c608
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file, and rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tch_data-makefile.patch => 0001-makefile.patch} |    0
 .../usb_modeswitch_data/usb_modeswitch_data.hash   |    2 ++
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 3 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch b/package/usb_modeswitch_data/0001-makefile.patch
similarity index 100%
rename from package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
rename to package/usb_modeswitch_data/0001-makefile.patch
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
new file mode 100644
index 0000000..2ccb3fc
--- /dev/null
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	90549f589835a68279369c3dc0d47eb7338ee3bad09d737e7b85e1ab15bd2d8b	usb-modeswitch-data-20150115.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 6ab9cea..01b0614 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20140529
+USB_MODESWITCH_DATA_VERSION = 20150115
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
