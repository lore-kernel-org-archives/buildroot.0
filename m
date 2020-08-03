From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  3 Aug 2020 19:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump to version 7.0.2
Message-ID: <1596474230-12032-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full changelog: https://github.com/fmtlib/fmt/releases/tag/7.0.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 19a8c8d..8559d66 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ac335a4ca6beaebec4ddb2bc35b9ae960b576f3b64a410ff2c379780f0cd4948  fmt-7.0.1.tar.gz
+sha256  7697e022f9cdc4f90b5e0a409643faa2cde0a6312f85e575c8388a1913374de5  fmt-7.0.2.tar.gz
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index cfd4512..10e2f0f 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 7.0.1
+FMT_VERSION = 7.0.2
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
-- 
2.7.4
