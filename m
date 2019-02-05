From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  5 Feb 2019 12:55:53 +0100
Subject: [Buildroot] [PATCH] package/tpm2-tss: bump version to 2.1.1
Message-ID: <20190205115553.16914-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of issues since 2.1.0:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index d6f65fa7de..8d62320239 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 a50b8dbd51f0c274cf874351786ed252c5024c952bf699fbd595ac292a27ab19  tpm2-tss-2.1.0.tar.gz
+sha256 b3f3a0319a3ed9d03465755b57bc60ec5e3b3bac2a0d1d2c79ca1ed412aed8ce  tpm2-tss-2.1.1.tar.gz
 sha256 f7da3c2da12cec3348bb7ee9e2a9e651a241450b2efb67da29d5a75ef2da058a  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index ecd9db11fa..672f483d44 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 2.1.0
+TPM2_TSS_VERSION = 2.1.1
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
-- 
2.11.0
