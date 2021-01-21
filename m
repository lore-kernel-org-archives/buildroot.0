From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:01:54 +0100
Subject: [Buildroot] [git commit] package/cifs-utils: add
 CIFS_UTILS_CPE_ID_VENDOR
Message-ID: <20210121204358.8227E821D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6863f00ab3b59fe0824bd484a4eb0169a7287110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:samba:cifs-utils is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asamba%3Acifs-utils

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cifs-utils/cifs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index b06ce7dddf..63b454413c 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -9,6 +9,7 @@ CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
 CIFS_UTILS_LICENSE_FILES = COPYING
+CIFS_UTILS_CPE_ID_VENDOR = samba
 # Missing install-sh in release tarball and patching Makefile.am
 CIFS_UTILS_AUTORECONF = YES
 CIFS_UTILS_DEPENDENCIES = host-pkgconf
