From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jan 2020 16:15:35 +0100
Subject: [Buildroot] [PATCH] package/tpm2-tools: bump version to 4.1.1
Message-ID: <20200130151535.14479-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfix release, fixing a number of issues in the 4.1 release.  For details,
see the announcement:

https://github.com/tpm2-software/tpm2-tools/releases/tag/4.1.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index 9d36d70f78..16059627ac 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 07ce37f552ed47f582fbc3423bc316fea64012ef15a92a25766a36534524dcf2  tpm2-tools-4.1.tar.gz
+sha256 40b9263d8b949bd2bc03a3cd60fa242e27116727467f9bbdd0b5f2539a25a7b1  tpm2-tools-4.1.1.tar.gz
 sha256 e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 692bda8d8b..4ebca0f906 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 4.1
+TPM2_TOOLS_VERSION = 4.1.1
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
-- 
2.20.1
