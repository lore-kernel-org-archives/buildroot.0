From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 21 Jan 2021 14:36:52 +0100
Subject: [Buildroot] [PATCH 14/15] package/libjpeg: add LIBJPEG_CPE_ID_VENDOR
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121133639.7332-14-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ijg:libjpeg is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aijg%3Alibjpeg

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libjpeg/libjpeg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b855344f3c..389ecb6299 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,6 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
+LIBJPEG_CPE_ID_VENDOR = ijg
 LIBJPEG_PROVIDES = jpeg
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
-- 
2.30.0
