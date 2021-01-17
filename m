From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:13:34 +0100
Subject: [Buildroot] [git commit] package/quagga: add QUAGGA_CPE_ID_VENDOR
Message-ID: <20210117155739.34DEE88229@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e697bf58edcb85267eb274f23c3e384fdcb08a45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:quagga:quagga is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aquagga%3Aquagga

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/quagga/quagga.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 0b352aa367..adf8085054 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -10,6 +10,7 @@ QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
 QUAGGA_LICENSE_FILES = COPYING
+QUAGGA_CPE_ID_VENDOR = quagga
 
 # We need to override the sysconf and localstate directories so that
 # quagga can create files as the quagga user without extra
