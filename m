From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 11:29:28 +0100
Subject: [Buildroot] [git commit] package/leptonica: bump to version 1.80.0
Message-ID: <20210131101052.00DDE813B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5159f656608cb1a136c0fed8372ffe8ec3a75b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added 2 spaces indentation in hash file

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leptonica/leptonica.hash | 4 ++--
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 56f8643355..213716705b 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 e2ed2e81e7a22ddf45d2c05f0bc8b9ae7450545d995bfe28517ba408d14a5a88  leptonica-1.78.0.tar.gz
-sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
+sha256  ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4  leptonica-1.80.0.tar.gz
+sha256  ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 309c65052b..06eda6acca 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.78.0
+LEPTONICA_VERSION = 1.80.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
