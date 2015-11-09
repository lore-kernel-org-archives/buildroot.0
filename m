From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Nov 2015 08:18:57 -0300
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch_data: bump to version
	20151101
In-Reply-To: <1447067937-1834-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447067937-1834-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447067937-1834-2-git-send-email-gustavo@zacarias.com.ar>
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
index ea36839..05a5445 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.hash
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	826096cb35a487c6e924b1318074988457220b5e72812e5393597950dd9eefc2	usb-modeswitch-data-20150627.tar.bz2
+sha256	584d362bc0060c02016edaac7b05ebd6558d5dcbdf14f1ae6d0ec9630265a982	usb-modeswitch-data-20151101.tar.bz2
diff --git a/package/usb_modeswitch_data/usb_modeswitch_data.mk b/package/usb_modeswitch_data/usb_modeswitch_data.mk
index 1b397cb..d8d5622 100644
--- a/package/usb_modeswitch_data/usb_modeswitch_data.mk
+++ b/package/usb_modeswitch_data/usb_modeswitch_data.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_DATA_VERSION = 20150627
+USB_MODESWITCH_DATA_VERSION = 20151101
 USB_MODESWITCH_DATA_SOURCE = usb-modeswitch-data-$(USB_MODESWITCH_DATA_VERSION).tar.bz2
 USB_MODESWITCH_DATA_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DATA_DEPENDENCIES = usb_modeswitch
-- 
2.4.10
