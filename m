From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Feb 2021 16:53:46 +0100
Subject: [Buildroot] [git commit] package/openntpd: add
 OPENNTPD_CPE_ID_VENDOR
Message-ID: <20210227153339.478D38648E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4f42d03d60ba3af61c10a2b409b62011d8f21f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:openntpd:openntpd is a valid CPE identifier for this package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenntpd%3Aopenntpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openntpd/openntpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 9076f3ddda..30c39e45ed 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
+OPENNTPD_CPE_ID_VENDOR = openntpd
 OPENNTPD_DEPENDENCIES = host-bison
 # Need to autoreconf for our libtool patch to apply properly
 OPENNTPD_AUTORECONF = YES
