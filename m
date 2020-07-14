From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:34:41 +0200
Subject: [Buildroot] [git commit] package/optee-benchmark: bump to version
 3.9.0
Message-ID: <20200714133101.EC41F82295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=387747c755d4880d68ea64ced6a4a5f4945563fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE benchmark package version to OP-TEE release 3.9.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 3f5195db62..938f9ad8a4 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.7.0.tar.gz
-sha256 c2bbeb188e3ebe06c62b1a7d6483d023737695c36d4752402fae33bd8f487c40 optee-benchmark-3.7.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.9.0.tar.gz
+sha256 84ea29c74de8cba99022f411a7c12451a9b8b71da608aa2ce75a975296ea1e3f optee-benchmark-3.9.0.tar.gz
 # Locally computed
 sha256 0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 9d67f9d262..aef6176968 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.7.0
+OPTEE_BENCHMARK_VERSION = 3.9.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
