From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:41 +0100
Subject: [Buildroot] [git commit] package/optee-test: bump to version 3.12.0
Message-ID: <20210308072140.7BB2F81132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ed41deaf7d5e53e7c70150105813d5c3714e5e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Test package version to OP-TEE release 3.12.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 52e2373bf7..0c789e1cd1 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.11.0.tar.gz
-sha256 54d4b7e2ad22cd409ee8e25e990c1878690b1b5eb8843f649d12022888186a53  optee-test-3.11.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.12.0/optee-test-3.12.0.tar.gz
+sha256 beebdc98e95af2e7a20595f7d6ca716872efde1ec74a48ab07be599f21e8ad70  optee-test-3.12.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 1f4f586672..2304b15925 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.11.0
+OPTEE_TEST_VERSION = 3.12.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
