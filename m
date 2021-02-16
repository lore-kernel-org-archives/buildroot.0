From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Feb 2021 09:07:56 +0100
Subject: [Buildroot] [PATCH 3/3] package/mongoose: add MONGOOSE_CPE_ID_VENDOR
In-Reply-To: <20210216080756.1635858-1-fontaine.fabrice@gmail.com>
References: <20210216080756.1635858-1-fontaine.fabrice@gmail.com>
Message-ID: <20210216080756.1635858-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cesanta:mongoose is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acesanta%3Amongoose

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.0
