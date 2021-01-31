From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:28:05 +0100
Subject: [Buildroot] [git commit] package/vdr: add VDR_CPE_ID_VENDOR
Message-ID: <20210131200802.88934814C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63ac3bc5d8e7293bd8e0ec1593dceca7f69c3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tvdr:vdr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atvdr%3Avdr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vdr/vdr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index fc456c2a30..eac13bfff4 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -9,6 +9,7 @@ VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
+VDR_CPE_ID_VENDOR = tvdr
 VDR_INSTALL_STAGING = YES
 VDR_DEPENDENCIES = \
 	host-pkgconf \
