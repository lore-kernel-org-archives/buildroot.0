From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon,  6 Jan 2014 11:14:06 -0500
Subject: [Buildroot] [PATCH] libdmtx: add license information
Message-ID: <1389024846-17491-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libdmtx/libdmtx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 69c7b88..43b35ec 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -6,6 +6,8 @@
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
+LIBDMTX_LICENSE = BSD-2c or Commercial license
+LIBDMTX_LICENSE_FILES = LICENSE
 LIBDMTX_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.8.3.2
