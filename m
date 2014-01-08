From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed,  8 Jan 2014 09:16:09 -0500
Subject: [Buildroot] [PATCH v2] libdmtx: add license information
Message-ID: <1389190569-3570-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Changed alternate license wording to "Special Permission" as
    suggested by Mike Zick

 package/libdmtx/libdmtx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 69c7b88..146534e 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -6,6 +6,8 @@
 
 LIBDMTX_VERSION = 0.7.4
 LIBDMTX_SITE = http://downloads.sourceforge.net/project/libdmtx/libdmtx/$(LIBDMTX_VERSION)
+LIBDMTX_LICENSE = BSD-2c or Special Permission
+LIBDMTX_LICENSE_FILES = LICENSE
 LIBDMTX_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.8.3.2
