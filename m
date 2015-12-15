From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:01:18 +0100
Subject: [Buildroot] [git commit] dtv-scan-tables: comma separate licenses
Message-ID: <20151215210843.66D7880409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17de8f60039f8744986521e3e77ee1cd5bb434ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
