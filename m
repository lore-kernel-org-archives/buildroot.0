From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jun 2017 08:35:55 +0300
Subject: [Buildroot] [PATCH] libpth: fix license file
Message-ID: <ca5a0f1123afc72871307ceb53c0f55806afc8be.1497504955.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bef/bef969ede5fc792b0a03f5669071600a0f746a7a/
http://autobuild.buildroot.net/results/2d5/2d59b8e6d69b70c621ff2031a9c4fd9e67ef13cf/
http://autobuild.buildroot.net/results/631/6318505c8e293e6c00b20eec39d851d0d15f6fec/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnpth/libnpth.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index dcaf8685ae1a..b1ccbf2cdb0e 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -8,7 +8,7 @@ LIBNPTH_VERSION = 1.5
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-3.0+ or GPL-2.0+
-LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
+LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.11.0
