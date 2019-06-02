From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:44 -0000
Subject: [Buildroot] [git commit] package/optee-benchmark: bump version to
 3.5.0
Message-ID: <20190602201233.D8C6F81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2635966f8f8b9f17e3679bf248fdc26cd2cf6022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Benchmark package version to release 3.5.0
which now provides an identified LICENSE file.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Thomas: add missing LICENSE_FILES variable, fix hash]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-benchmark/optee-benchmark.hash | 6 ++++--
 package/optee-benchmark/optee-benchmark.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index c3c41b69da..eb4004ba6d 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,2 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.4.0.tar.gz
-sha256 e5e868a06a9dcc8cc444b3e72c65f57670b0811091be62edbe0d03d13c75e716 optee-benchmark-3.4.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.5.0.tar.gz
+sha256 678fd4d3f65d7e18952f4505a1caad6c7ebfef67458a2e92fb51f8c098e7f439 optee-benchmark-3.5.0.tar.gz
+# Locally computed
+sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 4ebab4498e..5f6fac4a05 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.4.0
+OPTEE_BENCHMARK_VERSION = 3.5.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
+OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
 
 OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
 
