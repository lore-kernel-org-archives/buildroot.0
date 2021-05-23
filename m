From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 17:58:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/uclibc: add CPE
 variables
Message-ID: <20210523160324.B46788A2FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69470f9d323e6788aa571e7b5b082cf68c5ca432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:uclibc-ng_project:uclibc-ng is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Auclibc-ng_project%3Auclibc-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 81c93749ae4b09023e864b5980d4f0a543445764)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3d253d93bc..a7c96684d0 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -10,6 +10,8 @@ UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
 UCLIBC_LICENSE_FILES = COPYING.LIB
 UCLIBC_INSTALL_STAGING = YES
+UCLIBC_CPE_ID_VENDOR = uclibc-ng_project
+UCLIBC_CPE_ID_PRODUCT = uclibc-ng
 
 define UCLIBC_HELP_CMDS
 	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
