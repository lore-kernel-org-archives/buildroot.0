From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 15:54:47 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/tpm2-tss: bump
 version to 3.0.3
Message-ID: <20210105145257.EE6F1810E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b1ca8c56eb3ec7ab881c0fddcf832e6f9067c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 37427714374e7ee66d8629eda8f4389b9a65b7a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.hash | 2 +-
 package/tpm2-tss/tpm2-tss.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index 49432314d0..6856fd4fde 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2432533a1cac0f0d15d0337d2f0a23591a50b36aad68ab72412ce694818b7e76  tpm2-tss-3.0.1.tar.gz
+sha256  78392be7309baf47f51b122f566ac915fd4d1760ea78571cba2e1484f9b5be17  tpm2-tss-3.0.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 70e39bc2b3..bde6b352bf 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.0.1
+TPM2_TSS_VERSION = 3.0.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
