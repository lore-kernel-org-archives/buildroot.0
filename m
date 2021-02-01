From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 18:55:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/snappy: add SNAPPY_CPE_ID_VENDOR
Message-ID: <20210201175548.992198-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:google:snappy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agoogle%3Asnappy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snappy/snappy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index b764a0e4d0..e1fa28fbce 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -8,6 +8,7 @@ SNAPPY_VERSION = 1.1.8
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
+SNAPPY_CPE_ID_VENDOR = google
 SNAPPY_INSTALL_STAGING = YES
 SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
 
-- 
2.29.2
