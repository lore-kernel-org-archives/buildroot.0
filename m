From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 17:25:47 +0200
Subject: [Buildroot] [git commit] dtv-scan-tables: fix license files
Message-ID: <20140330152609.B112D9BC08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96b4550503d2a8515ea8cc8dce2297e22d2d0f9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/39a/39a8ba05c0d6e02b517d44b9c54b76acdb9174c2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtv-scan-tables/dtv-scan-tables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 470db8c..db7fb91 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -15,7 +15,7 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 # license files (respectively for the GPLv2 and the LGPLv2.1), so we use
 # that as the licensing information.
 DTV_SCAN_TABLES_LICENSE = GPLv2 LGPLv2.1
-DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LIB
+DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
 define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
 	for f in atsc dvb-c dvb-s dvb-t; do \
