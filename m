From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:38 +0100
Subject: [Buildroot] [git commit] package/e2fsprogs: set
 E2FSPROGS_CPE_ID_VALID
Message-ID: <20210302201929.9E0128349A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbb31dac92941085162b05f3ae96484afc9504f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:e2fsprogs_project:e2fsprogs is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ae2fsprogs_project%3Ae2fsprogs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/e2fsprogs/e2fsprogs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index eb82a55ce7..e2d6263c4e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -9,6 +9,7 @@ E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
 E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
+E2FSPROGS_CPE_ID_VALID = YES
 E2FSPROGS_INSTALL_STAGING = YES
 
 # Use libblkid and libuuid from util-linux for host and target packages.
