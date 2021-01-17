From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 17 Jan 2021 15:33:25 +0100
Subject: [Buildroot] [PATCH] package/ipmitool: set IPMITOOL_CPE_ID_VALID
Message-ID: <20210117143329.27231-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ipmitool_project:ipmitool is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=ipmitool

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/ipmitool/ipmitool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 123dd274f4..facd97a0b8 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -9,6 +9,7 @@ IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
+IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 
 # 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
 # 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
-- 
2.20.1
