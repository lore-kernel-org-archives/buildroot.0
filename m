From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 29 Oct 2019 15:41:31 +0100
Subject: [Buildroot] [PATCH 5/5] package/optee-benchmark: bump version to
 3.7.0
In-Reply-To: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
References: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
Message-ID: <a71a79cbb092682efd0fbf335a418125352aabdc.1572355772.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Benchmark package version to release 3.7.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index eb4004ba6d..3f5195db62 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.5.0.tar.gz
-sha256 678fd4d3f65d7e18952f4505a1caad6c7ebfef67458a2e92fb51f8c098e7f439 optee-benchmark-3.5.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.7.0.tar.gz
+sha256 c2bbeb188e3ebe06c62b1a7d6483d023737695c36d4752402fae33bd8f487c40 optee-benchmark-3.7.0.tar.gz
 # Locally computed
 sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 5f6fac4a05..9d67f9d262 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.5.0
+OPTEE_BENCHMARK_VERSION = 3.7.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.17.1
