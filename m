From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:00:32 +0200
Subject: [Buildroot] [git commit] package/fmt: bump to version 7.0.2
Message-ID: <20200805125459.A786E83908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=884ec6b86d15a4627b0fb2fdf44feccf0fa0c53a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog: https://github.com/fmtlib/fmt/releases/tag/7.0.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 19a8c8d9fe..8559d6605f 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ac335a4ca6beaebec4ddb2bc35b9ae960b576f3b64a410ff2c379780f0cd4948  fmt-7.0.1.tar.gz
+sha256  7697e022f9cdc4f90b5e0a409643faa2cde0a6312f85e575c8388a1913374de5  fmt-7.0.2.tar.gz
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index cfd4512a89..10e2f0f0b4 100644
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
