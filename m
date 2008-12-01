From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Dec 2008 01:07:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/i2c-tools
Message-ID: <20081201090759.054703C2C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-01 01:07:58 -0800 (Mon, 01 Dec 2008)
New Revision: 24198

Log:
i2c-tools: bump version

Modified:
   trunk/buildroot/package/i2c-tools/i2c-tools.mk


Changeset:
Modified: trunk/buildroot/package/i2c-tools/i2c-tools.mk
===================================================================
--- trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-12-01 08:40:30 UTC (rev 24197)
+++ trunk/buildroot/package/i2c-tools/i2c-tools.mk	2008-12-01 09:07:58 UTC (rev 24198)
@@ -3,7 +3,7 @@
 # i2c-tools
 #
 #############################################################
-I2C_TOOLS_VERSION:=3.0.1
+I2C_TOOLS_VERSION:=3.0.2
 I2C_TOOLS_SOURCE:=i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE:=http://dl.lm-sensors.org/i2c-tools/releases/
 I2C_TOOLS_DIR:=$(BUILD_DIR)/i2c-tools-$(I2C_TOOLS_VERSION)
