From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 20:20:08 -0500
Subject: [Buildroot] [PATCH v2 1/2] package/libqmi: add _CPE_ID_VENDOR
Message-ID: <20210421012009.4494-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libqmi_project:libqmi:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libqmi_project:libqmi

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
v2 - added SOB and moved variable assignment under license files
---
 package/libqmi/libqmi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 4b430d11f8..6fc6d4a50d 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -9,6 +9,7 @@ LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
+LIBQMI_CPE_ID_VENDOR = libqmi_project
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
-- 
2.17.1
