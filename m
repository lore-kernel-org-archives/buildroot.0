From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 22:19:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/xen: add CPE variables
Message-ID: <20210117211959.489037-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:o:xen:xen is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Axen%3Axen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xen/xen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index cb1ea23ba6..3a758b7b20 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,6 +8,8 @@ XEN_VERSION = 4.14.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
+XEN_CPE_ID_VENDOR = xen
+XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
 
 # Calculate XEN_ARCH
-- 
2.29.2
