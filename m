From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 10:23:09 -0300
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch_data: bump to version
	20150115
In-Reply-To: <1421673789-563-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421673789-563-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421673789-563-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file, and rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{usb_modeswitch_data-makefile.patch => 0001-makefile.patch}         | 0
 package/usb_modeswitch_data/usb_modeswitch_data.hash                    | 2 ++
 package/usb_modeswitch_data/usb_modeswitch_data.mk                      | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename package/usb_modeswitch_data/{usb_modeswitch_data-makefile.patch => 0001-makefile.patch} (100%)
 create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data.hash

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
-- 
2.0.5
