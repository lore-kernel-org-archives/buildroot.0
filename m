From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 22:03:18 +0100
Subject: [Buildroot] [git commit] tmp2-tss: bump to version 1.4.0
Message-ID: <20180318222454.9BF62816A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=832e83f9f484d25b4b6ff1aa39ddada9d2adff5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improved compliance to the last public review spec and some bug fixes.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
