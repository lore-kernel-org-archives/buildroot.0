From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Apr 2019 16:57:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/tpm2-tools: bump version to 3.1.4
In-Reply-To: <20190402145753.25555-1-peter@korsgaard.com>
References: <20190402145753.25555-1-peter@korsgaard.com>
Message-ID: <20190402145753.25555-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a number of issues discovered post-3.1.3, including a completely
broken -T option handling.  For details, see:
https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.hash | 2 +-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index ae228c591c..d2bd31cdee 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 cc95576f49cf9bacf75772fd98dcb7edc5172a6a8dfa20c215fe3cc69b0a3a16  tpm2-tools-3.1.3.tar.gz
+sha256 2f515200e9a7958ee13015150f7958c8a332eb071c2564c33f81ebe32c4f6033  tpm2-tools-3.1.4.tar.gz
 sha256 3d6b149c8b042bd5f3db678d587fbe55230d071ca084bd38dcae451679c6dd45  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index f7e2f85228..381873a8f9 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 3.1.3
+TPM2_TOOLS_VERSION = 3.1.4
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-2-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
-- 
2.11.0
