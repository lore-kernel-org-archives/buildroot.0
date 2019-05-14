From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 10:20:41 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/optee-benchmark: bump version to
 3.5.0
In-Reply-To: <20190514082041.3487-1-etienne.carriere@linaro.org>
References: <20190514082041.3487-1-etienne.carriere@linaro.org>
Message-ID: <20190514082041.3487-7-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Benchmark package version to release 3.5.0
which now provides an identified LICENSE file.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
- Fix on commit message: s/OP-TEE OS/OP-TEE Benchmark/.
Changes v1 -> v2:
- No change
---
 package/optee-benchmark/optee-benchmark.hash | 6 ++++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index c3c41b69da..a19427ea13 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,2 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.4.0.tar.gz
-sha256 e5e868a06a9dcc8cc444b3e72c65f57670b0811091be62edbe0d03d13c75e716 optee-benchmark-3.4.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.5.0.tar.gz
+sha256 678fd4d3f65d7e18952f4505a1caad6c7ebfef67458a2e92fb51f8c098e7f439 optee-benchmark-3.5.0.tar.gz
+# Locally computed
+sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 4ebab4498e..54f1359444 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.4.0
+OPTEE_BENCHMARK_VERSION = 3.5.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 
-- 
2.17.1
