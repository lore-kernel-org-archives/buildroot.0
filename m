From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 15:57:37 +0200
Subject: [Buildroot] [git commit] package/bluez_utils: add missing
	host-pkgconf dependency
Message-ID: <20170514135745.E68BB82675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5fec33bd5e4a928d60bdc8693ca2917b3e91a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script use pkg-config.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/bluez_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index b396886..526804a 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -8,7 +8,7 @@ BLUEZ_UTILS_VERSION = 4.101
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
-BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ_UTILS_DEPENDENCIES = host-pkgconf dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
 BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
