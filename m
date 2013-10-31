From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 31 Oct 2013 14:29:05 +0100
Subject: [Buildroot] [PATCH v2] libmodbus: bump version and change download
	location
Message-ID: <1383226145-12195-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

The license of libmodbus is LGPL v2.1 or later and the
licence of programs in tests directory is GPL v3. So
specify only LGPL v2.1.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: add licence info
 package/libmodbus/libmodbus.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 8f93c2b..8aa3cd7 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.0.3
-LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
+LIBMODBUS_VERSION = 3.0.5
+LIBMODBUS_SITE = http://libmodbus.org/site_media/build/
+LIBMODBUS_LICENSE = LGPLv2.1+
+LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.7
