From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 28 May 2021 09:35:08 +0200
Subject: [Buildroot] [PATCH 2/5] package/optee-benchmark: bump to version
 3.13.0
In-Reply-To: <20210528073511.16854-1-etienne.carriere@linaro.org>
References: <20210528073511.16854-1-etienne.carriere@linaro.org>
Message-ID: <20210528073511.16854-2-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Benchmark package version to OP-TEE release 3.13.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 144069b6f3..51f248462b 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.12.0/optee-benchmark-3.12.0.tar.gz
-sha256 468635656fa483911cf605a96711d848f8e0f6b4a6137208226de364dee25fe4 optee-benchmark-3.12.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.13.0/optee-benchmark-3.13.0.tar.gz
+sha256 58431b0d48c634dcb86d5e307df157a99256d4328a77a5099e0b1b3cd79e2968 optee-benchmark-3.13.0.tar.gz
 # Locally computed
 sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index c17a7045d4..ce168def81 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.12.0
+OPTEE_BENCHMARK_VERSION = 3.13.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.17.1
