From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:11:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: add CPE variables
Message-ID: <20210516171101.4497-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tpm2_software_stack_project:tpm2_software_stack is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atpm2_software_stack_project%3Atpm2_software_stack

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tss/tpm2-tss.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index bde6b352bf..9ffbef2f07 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -8,6 +8,8 @@ TPM2_TSS_VERSION = 3.0.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
+TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
+TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
-- 
2.30.2
