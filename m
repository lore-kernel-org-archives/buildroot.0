From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Jul 2014 09:40:00 -0300
Subject: [Buildroot] [PATCH 02/13] usbmount: add license information
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404304811-27480-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbmount/usbmount.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index 89662b2..ca165fa 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -8,6 +8,8 @@ USBMOUNT_VERSION = 0.0.22
 USBMOUNT_SOURCE = usbmount_$(USBMOUNT_VERSION).tar.gz
 USBMOUNT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/u/usbmount
 USBMOUNT_DEPENDENCIES = udev lockfile-progs
+USBMOUNT_LICENSE = BSD-2c
+USBMOUNT_LICENSE_FILES = debian/copyright
 
 define USBMOUNT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
-- 
1.8.5.5
