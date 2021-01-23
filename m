From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:34:38 +0100
Subject: [Buildroot] [git commit] boot/at91bootstrap3: add CPE variables
Message-ID: <20210123201521.25C7482A95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aa8533213247e587286472789cb19578a2a4ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:linux_sam:at91bootstrap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinux_sam%3Aat91bootstrap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 5cf865c681..a942afcdc9 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -24,6 +24,9 @@ ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
 endif
 
+AT91BOOTSTRAP3_CPE_ID_VENDOR = linux4sam
+AT91BOOTSTRAP3_CPE_ID_PRODUCT = at91bootstrap
+
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
 
