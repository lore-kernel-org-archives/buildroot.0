From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Feb 2016 15:13:24 -0300
Subject: [Buildroot] [PATCH 2/2] usb-modeswitch-data: bump to version
	20160112
In-Reply-To: <1455214404-32549-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455214404-32549-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1455214404-32549-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch_data/usb_modeswitch_data.hash | 2 +-
 package/usb_modeswitch_data/usb_modeswitch_data.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.hash b/package/usb_modeswitch_data/usb_modeswitch_data.hash
index 05a5445..0df5475 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	584d362bc0060c02016edaac7b05ebd6558d5dcbdf14f1ae6d0ec9630265a982	usb-modeswitch-data-20151101.tar.bz2
+sha256	d679a44a48b1d1f243fea6b4d2bd54e0e08010ff579dd81eaf698954c0c6dfa7	usb-modeswitch-data-20160112.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index d8d5622..a0cbc12 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20151101
+USB_MODESWITCH_DATA_VERSION = 20160112
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
2.4.10
