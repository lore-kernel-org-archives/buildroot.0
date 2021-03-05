From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:57:24 +0100
Subject: [Buildroot] [git commit] package/libopenh264: add CPE variables
Message-ID: <20210305123919.C0E6287427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d82129ac6adbcef542ed510d5bd121008c57a2c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cisco:openh264 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acisco%3Aopenh264

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenh264/libopenh264.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 5a1000a6d8..0c17579979 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -8,6 +8,8 @@ LIBOPENH264_VERSION = 2.1.1
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
+LIBOPENH264_CPE_ID_VENDOR = cisco
+LIBOPENH264_CPE_ID_PRODUCT = openh264
 LIBOPENH264_INSTALL_STAGING = YES
 
 ifeq ($(BR2_aarch64),y)
