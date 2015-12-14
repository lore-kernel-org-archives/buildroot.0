From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:43 -0300
Subject: [Buildroot] [PATCH 04/45] dtv-scan-tables: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dtv-scan-tables/dtv-scan-tables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 58d794a..ab6a36c 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -14,7 +14,7 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 # However, the package prominently contains the COPYING and COPYING.LIB
 # license files (respectively for the GPLv2 and the LGPLv2.1), so we use
 # that as the licensing information.
-DTV_SCAN_TABLES_LICENSE = GPLv2 LGPLv2.1
+DTV_SCAN_TABLES_LICENSE = GPLv2, LGPLv2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
 define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
-- 
2.4.10
