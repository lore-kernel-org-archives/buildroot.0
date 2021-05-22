From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 21:59:42 +0200
Subject: [Buildroot] [git commit] package/picocom: add PICOCOM_CPE_ID_VENDOR
Message-ID: <20210522193402.B48D88915B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=214d4e9c2217f8680f269870e98a0ac9a64256e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:picocom_project:picocom is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apicocom_project%3Apicocom

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/picocom/picocom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index d27c734376..2d585bb2f5 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -8,6 +8,7 @@ PICOCOM_VERSION = 3.1
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
+PICOCOM_CPE_ID_VENDOR = picocom_project
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
