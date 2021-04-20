From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 21:24:58 +0200
Subject: [Buildroot] [git commit] package/fmt: add FMT_CPE_ID_VENDOR
Message-ID: <20210420185858.3B0DF81964@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32c10f256bbc3dd09a72d45107682afb4448f07b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:fmt:fmt is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afmt%3Afmt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fmt/fmt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 000bacfd7b..7ea7b9d69c 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -9,6 +9,7 @@ FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
+FMT_CPE_ID_VENDOR  = fmt
 FMT_INSTALL_STAGING = YES
 
 FMT_CONF_OPTS = \
