From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:37:03 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/usb_modeswitch:
 bump to version 2.6.1
Message-ID: <20210426203328.B5FD4815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14dfd8eb179b2cd520192b82a3dcff73a2b8be03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Update indentation in hash file (two spaces)

https://www.draisberghof.de/usb_modeswitch/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9192f465ea0ae420f9a89927f7f9a80028d9b379)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.hash | 8 ++++----
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 4cbd5dbea2..765a2438c2 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,5 +1,5 @@
-# From http://www.draisberghof.de/usb_modeswitch/
-md5	 be73dcc84025794081a1d4d4e5a75e4c  usb-modeswitch-2.6.0.tar.bz2
+# From https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-versions.xml
+md5  69d00d6ed7097b97d972a159d14cfba1  usb-modeswitch-2.6.1.tar.bz2
 # Locally calculated
-sha256	c215236e6bada6e659fc195a31d611ea298a4bdb4d57a0d68c553b56585f8ba3  usb-modeswitch-2.6.0.tar.bz2
-sha256	6195429209313925c0eba6c0da4ee7a6cb4277b99e35c886913f80f91ec20b94  COPYING
+sha256  5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34  usb-modeswitch-2.6.1.tar.bz2
+sha256  6195429209313925c0eba6c0da4ee7a6cb4277b99e35c886913f80f91ec20b94  COPYING
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 064e1960b0..f2ee004b42 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.6.0
+USB_MODESWITCH_VERSION = 2.6.1
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
