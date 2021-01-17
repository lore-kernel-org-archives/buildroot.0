From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:08:52 +0100
Subject: [Buildroot] [git commit] package/polkit: set POLKIT_CPE_ID_VALID
Message-ID: <20210117155738.D8496815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5781e7fdc1ac2d81fbb53c61ff36ee9c8201e5bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:polkit_project:polkit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apolkit_project%3Apolkit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/polkit/polkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 3ae42b2312..e3fad53183 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -8,6 +8,7 @@ POLKIT_VERSION = 0.116
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
+POLKIT_CPE_ID_VALID = YES
 POLKIT_AUTORECONF = YES
 POLKIT_INSTALL_STAGING = YES
 
