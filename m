From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:07:57 +0100
Subject: [Buildroot] [git commit] package/ipmitool: set IPMITOOL_CPE_ID_VALID
Message-ID: <20210117155738.C0E3587590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1368a0988a3db1249d2642f214126eab9d6fc827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ipmitool_project:ipmitool is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=ipmitool

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr:
  - actually set IPMITOOL_CPE_ID_VALID, not IPMITOOL_CPE_ID_VENDOR
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ipmitool/ipmitool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 123dd274f4..29a0476589 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -9,6 +9,7 @@ IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
 IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
+IPMITOOL_CPE_ID_VALID = YES
 
 # 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
 # 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
