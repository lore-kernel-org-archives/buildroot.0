From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:40 +0100
Subject: [Buildroot] [git commit branch/next] package/optee-examples: bump
 to version 3.12.0
Message-ID: <20210306220945.C80F38763B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0198de312d94e59cef2825869a6af381552cf9eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump OP-TEE Examples package version to OP-TEE release 3.12.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 230d5d3ccf..d43534832a 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.11.0.tar.gz
-sha256 b910479a2d432014b6c49aafed27e26dd6f930e7c31d277c1500c1b60b4b3876  optee-examples-3.11.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.12.0/optee-examples-3.12.0.tar.gz
+sha256 d3ae2cc4c51900a887f4c93e58571305bd37d60718a281953c3d775b3113f1f8  optee-examples-3.12.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index b6f77c72f0..ca7956e5bc 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.11.0
+OPTEE_EXAMPLES_VERSION = 3.12.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
