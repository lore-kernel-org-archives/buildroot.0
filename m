From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 28 May 2021 09:35:10 +0200
Subject: [Buildroot] [PATCH 4/5] package/optee-examples: bump to version
 3.13.0
In-Reply-To: <20210528073511.16854-1-etienne.carriere@linaro.org>
References: <20210528073511.16854-1-etienne.carriere@linaro.org>
Message-ID: <20210528073511.16854-4-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Examples package version to OP-TEE release 3.13.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index d43534832a..5e1839f43f 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.12.0/optee-examples-3.12.0.tar.gz
-sha256 d3ae2cc4c51900a887f4c93e58571305bd37d60718a281953c3d775b3113f1f8  optee-examples-3.12.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.13.0/optee-examples-3.13.0.tar.gz
+sha256 2e97252a57a5d84fa5f33adec976cea2dbfb0e17f60b1ee912041be74f6b14f8  optee-examples-3.13.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index ca7956e5bc..484245c951 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.12.0
+OPTEE_EXAMPLES_VERSION = 3.13.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.17.1
