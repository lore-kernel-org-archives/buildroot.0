From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:05:36 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/tpm2-abrmd: bump
 to version 2.3.3
Message-ID: <20200828170226.857878377C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d49e9a0f0f7d4acc32378c85b47aa013895192e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Bugfix release with a single fix:

Fixed:
  - Fixed handle resource leak exhausting TPM resources.

https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.3.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b557b2e812483706f9d6d2df9585894a1b2235c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.hash | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index f69cd369bf..1c6e739056 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  df02c18882116e19b56aa8c701687c0c0987dd334e6fc002b340cedf6e000d10  tpm2-abrmd-2.3.2.tar.gz
+sha256  1e587808c6739079d59f124d9c1a0058f8d34dd84f1f656c946667fa0a181c48  tpm2-abrmd-2.3.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 9d22219f67..0584ba928a 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.3.2
+TPM2_ABRMD_VERSION = 2.3.3
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
