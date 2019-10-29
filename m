From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:27:33 +0100
Subject: [Buildroot] [git commit] package/optee-benchmark: bump version to
 3.7.0
Message-ID: <20191029212238.07C478D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5017edfc10396f092424c023b5f9ca3e5ab421ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Benchmark package version to release 3.7.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
