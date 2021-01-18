From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:48:59 +0100
Subject: [Buildroot] [git commit] package/mono: add MONO_CPE_ID_VENDOR
Message-ID: <20210118203943.3312C805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c665216603539c189aba7e7d868fdcaa05e246e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:mono-project:mono is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amono-project%3Amono

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index c53025a69f..df3481a498 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -10,6 +10,7 @@ MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
 MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
+MONO_CPE_ID_VENDOR = mono-project
 MONO_INSTALL_STAGING = YES
 
 ## Mono native
