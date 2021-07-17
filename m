From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:01:22 +0200
Subject: [Buildroot] [git commit] package/tpm2-tools: add
 TPM2_TOOLS_CPE_ID_VENDOR
Message-ID: <20210717072813.5A6F1867D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=7e913bf36e57414720ade33edd7db3d3bcfce935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tpm2-tools_project:tpm2-tools is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atpm2-tools_project%3Atpm2-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tools/tpm2-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index e83db416aa..584b4edb54 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -8,6 +8,7 @@ TPM2_TOOLS_VERSION = 4.3.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
+TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
