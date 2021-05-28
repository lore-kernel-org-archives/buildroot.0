From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 28 May 2021 09:35:11 +0200
Subject: [Buildroot] [PATCH 5/5] package/optee-test: bump to version 3.13.0
In-Reply-To: <20210528073511.16854-1-etienne.carriere@linaro.org>
References: <20210528073511.16854-1-etienne.carriere@linaro.org>
Message-ID: <20210528073511.16854-5-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Test package version to OP-TEE release 3.13.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 0c789e1cd1..39bd68532d 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.12.0/optee-test-3.12.0.tar.gz
-sha256 beebdc98e95af2e7a20595f7d6ca716872efde1ec74a48ab07be599f21e8ad70  optee-test-3.12.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.13.0/optee-test-3.13.0.tar.gz
+sha256 4dda2a6b2f7667664cc3bc2578a90c1e60fef7e1c296b8fa8f317ba93302a652  optee-test-3.13.0.tar.gz
 # Locally computed
 sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index a2d18dadfc..ed6ec3fb39 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.12.0
+OPTEE_TEST_VERSION = 3.13.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.17.1
