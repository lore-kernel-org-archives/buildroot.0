From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Mon, 12 Jul 2021 07:43:51 +0000
Subject: [Buildroot] [PATCH] package/tpm2-pkcs11: bump version to 1.6.0
In-Reply-To: <RehKnYdIppFz1OmXjdyv70Ih-Zv9yCyN4qCHBqFZWNIzQIrS67SR2FSeTgcTJ1iHo8Iy2N_bTjVRyrQV54oNXTAyaygA_XjuHPBKeC8gqFI=@protonmail.com>
References: <RehKnYdIppFz1OmXjdyv70Ih-Zv9yCyN4qCHBqFZWNIzQIrS67SR2FSeTgcTJ1iHo8Iy2N_bTjVRyrQV54oNXTAyaygA_XjuHPBKeC8gqFI=@protonmail.com>
Message-ID: <ITXjEqHVuAgihlyVzfMVWXaHsw2ZxWhptfJNhUvAT5gFdG0XKHcLI6a2QA-x48W0HEf0_Urd109HomtGk77O1V7vdvgmkCZaJsxfUcI4DaQ=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 16dd9166ba..18a225d5a9 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  13425c34358ec798d333743099b9aec5e42f6a4653c4c0e40eb075681f369687  tpm2-pkcs11-1.5.0.tar.gz
+sha256  61e2849c07acb4acbf756bdd6a9fe44f9475343256fa0bdc966b77321169c125  tpm2-pkcs11-1.6.0.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index 3acce07745..b26ce374e8 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TPM2_PKCS11_VERSION = 1.5.0
+TPM2_PKCS11_VERSION = 1.6.0
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
--
2.20.1
