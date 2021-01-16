From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 00:13:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/bsdiff: add BSDIFF_CPE_ID_VENDOR
Message-ID: <20210116231330.212511-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:daemonology:bsdiff is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adaemonology%3Absdiff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bsdiff/bsdiff.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index 9030284a0a..97a1b3921d 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -9,6 +9,7 @@ BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
 BSDIFF_LICENSE = BSD-2-Clause
 BSDIFF_LICENSE_FILES = bsdiff.c
+BSDIFF_CPE_ID_VENDOR = daemonology
 
 define BSDIFF_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-- 
2.29.2
