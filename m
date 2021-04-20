From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:27 -0500
Subject: [Buildroot] [PATCH 06/25] package/iproute2: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:iproute2_project:iproute2:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:iproute2_project:iproute2

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/iproute2/iproute2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 1b71f5c06a..3460c5c3b3 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -11,6 +11,7 @@ IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
 IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
+IPROUTE2_CPE_ID_VENDOR = iproute2_project
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
-- 
2.17.1
