From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:48 +0100
Subject: [Buildroot] [git commit] package/alsa-lib: add
 ALSA_LIB_CPE_ID_VENDOR
Message-ID: <20210121204358.1E37A812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2069420982fbdbcad12790d968e7facdcf43ea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:alsa-project:alsa-lib is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=alsa-lib

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-lib/alsa-lib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 728aec31a1..b1bfaf30e5 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -9,6 +9,7 @@ ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
 ALSA_LIB_LICENSE_FILES = COPYING aserver/COPYING
+ALSA_LIB_CPE_ID_VENDOR = alsa-project
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
 ALSA_LIB_AUTORECONF = YES
