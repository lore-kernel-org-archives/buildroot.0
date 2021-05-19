From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 08:40:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/musl: add MUSL_CPE_ID_VENDOR
Message-ID: <20210519064044.1632631-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:musl-libc:musl is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amusl-libc%3Amusl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/musl/musl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 82b3eeaf52..d4f26b50a7 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -8,6 +8,7 @@ MUSL_VERSION = 1.2.2
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
+MUSL_CPE_ID_VENDOR = musl-libc
 
 # Before musl is configured, we must have the first stage
 # cross-compiler and the kernel headers
-- 
2.30.2
