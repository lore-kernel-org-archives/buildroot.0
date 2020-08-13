From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 12:01:21 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/tpm2-tools: bump
 version to 4.1.2
Message-ID: <20200813095627.E9E0F85F44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5be79ef42d1bb74873a5de27b9faddcb7fff98fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Bugfix release with a single fix:

- Fix missing handle maps for ESY3 handle breaks. See #1994

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9652e2cbe5f31585b31f16f817505b231ea24d5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.hash | 4 ++--
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index 16059627ac..dd55834825 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 40b9263d8b949bd2bc03a3cd60fa242e27116727467f9bbdd0b5f2539a25a7b1  tpm2-tools-4.1.1.tar.gz
-sha256 e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
+sha256  175472b63d1e047c2ad38314d06c36bd734ae37e0c6abfa2a804c0d6eb3f2936  tpm2-tools-4.1.2.tar.gz
+sha256  e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 4ebca0f906..83be53d54b 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 4.1.1
+TPM2_TOOLS_VERSION = 4.1.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
