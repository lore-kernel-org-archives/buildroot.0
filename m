From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 15 Mar 2018 09:55:59 -0300
Subject: [Buildroot] [PATCH 2/5] tmp2-tss: bump to version 1.4.0
In-Reply-To: <20180315125602.26186-1-casantos@datacom.ind.br>
References: <20180315125602.26186-1-casantos@datacom.ind.br>
Message-ID: <20180315125602.26186-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Improved compliance to the last public review spec and some bug fixes.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index df1c6d8b58..67c5a85842 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 c7d627de50394e9a02593edb1ce74e1bbac17831be726c54f689507f0c41a78a  tpm2-tss-1.3.0.tar.gz
+sha256 cf8784cc536be16e6fba47f77033e093a6aeaed8420877ac9f42f77fb7b09031  tpm2-tss-1.4.0.tar.gz
 sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 709602860f..f5169a2770 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 1.3.0
+TPM2_TSS_VERSION = 1.4.0
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
-- 
2.14.3
