From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 12:27:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/blktrace: add BLKTRACE_CPE_ID_VENDOR
Message-ID: <20210523102757.1518238-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:blktrace_project:blktrace is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ablktrace_project%3Ablktrace

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/blktrace/blktrace.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index 4ada2e8e4b..1a5f59bcce 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -9,6 +9,7 @@ BLKTRACE_SITE = http://brick.kernel.dk/snaps
 BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPL-2.0+
 BLKTRACE_LICENSE_FILES = COPYING
+BLKTRACE_CPE_ID_VENDOR = blktrace_project
 
 # 0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
 BLKTRACE_IGNORE_CVES += CVE-2018-10689
-- 
2.30.2
