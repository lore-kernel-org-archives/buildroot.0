From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 17:55:50 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/nasm: add CPE
 variables
Message-ID: <20210523160324.9AD1987A45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b34d98582fc644533cfe368c0210a5ba33a4bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:nasm:netwide_assembler is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anasm%3Anetwide_assembler

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 760d76ac98e088a3caaf024d5914cd6b3841c6dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nasm/nasm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b44b97e62b..ecb0889363 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -9,5 +9,7 @@ NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
 NASM_LICENSE_FILES = LICENSE
+NASM_CPE_ID_VENDOR = nasm
+NASM_CPE_ID_PRODUCT = netwide_assembler
 
 $(eval $(host-autotools-package))
