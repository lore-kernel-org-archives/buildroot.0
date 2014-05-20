From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Tue, 20 May 2014 13:52:59 +1200
Subject: [Buildroot] [PATCH 2/3] i2c-tools: udated to version 3.1.1
In-Reply-To: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1400550780-16669-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <1400550780-16669-2-git-send-email-oli.vogt.pub01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

3.1.0 is dated 2011-12-04.
3.1.1 is from 2014-02-20 and has quite a few enhancements.

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
---
 package/i2c-tools/i2c-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index c6a967d..286c868 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.0
+I2C_TOOLS_VERSION = 3.1.1
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
-- 
1.9.1
