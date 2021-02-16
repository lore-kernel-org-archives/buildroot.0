From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Feb 2021 20:41:21 +0100
Subject: [Buildroot] [git commit] package/mongoose: add
 MONGOOSE_CPE_ID_VENDOR
Message-ID: <20210216192158.26A218469C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d632c941f2a7e0eff3de7a7dd93bb44ef858394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cesanta:mongoose is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acesanta%3Amongoose

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 5c331cf48e..0974c76446 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,6 +8,7 @@ MONGOOSE_VERSION = 7.1
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
+MONGOOSE_CPE_ID_VENDOR = cesenta
 MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
