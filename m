From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:38:07 +0200
Subject: [Buildroot] [git commit] package/bluez5_utils: remove autoreconf
Message-ID: <20160522194141.64A9981D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d9f74df6a491c96969375bdd4ef9d9ecef6cd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-Link-mcaptest-with-lrt.patch was removed 2016-01-05:
https://git.busybox.net/buildroot/commit/package/bluez5_utils?id=e2274856123fcc387df95675d7a66eb2c576eaa2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/bluez5_utils.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 659f05d..ddc8c45 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,9 +12,6 @@ BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
-# 0001-Link-mcaptest-with-lrt.patch
-BLUEZ5_UTILS_AUTORECONF = YES
-
 BLUEZ5_UTILS_CONF_OPTS = 	\
 	--enable-tools 		\
 	--enable-library 	\
