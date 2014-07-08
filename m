From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:41:33 +0200
Subject: [Buildroot] [git commit] usbmount: add license information
Message-ID: <20140708222427.D2F459D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1188bca2d5879e50efe082b14a26dc2aed5cca9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbmount/usbmount.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
