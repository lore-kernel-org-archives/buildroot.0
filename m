From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Jun 2016 06:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/zyre: update license
Message-ID: <1465189080-6604-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project switched to MPLv2.0:
https://github.com/zeromq/zyre/issues/327

Fixes
http://autobuild.buildroot.net/results/88f/88fa0b150ad83e42625666cbffdf95ee178015cb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zyre/zyre.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index b17dfd0..86378df 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -6,8 +6,8 @@
 
 ZYRE_VERSION = a351468b7d313fc90c446668122365851a9c60e4
 ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
-ZYRE_LICENSE = LGPLv3+
-ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
+ZYRE_LICENSE = MPLv2.0
+ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
 ZYRE_AUTORECONF = YES
-- 
2.8.1
