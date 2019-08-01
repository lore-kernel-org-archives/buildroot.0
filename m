From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:18:11 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: bump to version 7.0.1
Message-ID: <20190801161619.4233981377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=070bebfa0b05ce85d7b0dc468772461d058b5219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though the hash of the license file changes, there are no changes
in the licensing terms themselves. There are changes in other parts of
readme.md, and whitespace changes in the licensing terms, but no
licensing term changes per-se.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
[Thomas: add explanation about the license file hash change]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinyxml2/tinyxml2.hash | 4 ++--
 package/tinyxml2/tinyxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index 5f38546466..88291e4f39 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cdf0c2179ae7a7931dba52463741cf59024198bbf9673bf08415bcb46344110f  tinyxml2-6.2.0.tar.gz
-sha256 8b2ab0b6ffb86798a2512f45fcf50a3b04b3516782d2e3fb30ebf55dc18c7cce  readme.md
+sha256 a381729e32b6c2916a23544c04f342682d38b3f6e6c0cad3c25e900c3a7ef1a6  tinyxml2-7.0.1.tar.gz
+sha256 35e49ea659da39b72b0e2f38214f9799b548225b0950c8dbb6d183b4c1455263  readme.md
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 9439c5cb80..7f362f3d33 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 6.2.0
+TINYXML2_VERSION = 7.0.1
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = Zlib
 TINYXML2_LICENSE_FILES = readme.md
