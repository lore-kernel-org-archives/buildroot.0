From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 08:54:08 +0200
Subject: [Buildroot] [git commit] gmp: correct legal info
Message-ID: <20160705071604.2092A817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6a7ad5fa5baa9224d278546f2d536436a1830e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 6, GMP is distributed under the dual licenses LGPLv3+ or
GPLv2+

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cdde794..485bf7c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -8,8 +8,8 @@ GMP_VERSION = 6.1.1
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
-GMP_LICENSE = LGPLv3+
-GMP_LICENSE_FILES = COPYING.LESSERv3
+GMP_LICENSE = LGPLv3+ or GPLv2+
+GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
