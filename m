From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:33 -0500
Subject: [Buildroot] [PATCH 12/25] package/libqmi: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-12-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libqmi_project:libqmi:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libqmi_project:libqmi
---
 package/libqmi/libqmi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 4b430d11f8..01910898c9 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -10,6 +10,7 @@ LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_INSTALL_STAGING = YES
+LIBQMI_CPE_ID_VENDOR = libqmi_project
 
 LIBQMI_DEPENDENCIES = libglib2
 
-- 
2.17.1
