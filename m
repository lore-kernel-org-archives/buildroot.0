From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:29:43 +0100
Subject: [Buildroot] [git commit] package/optee-examples: bump version to
 3.7.0
Message-ID: <20191029212313.2C2B48D4DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=797736770f15060d74369a047a6e62307aa71892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Examples package version to release 3.7.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 980595eb69..8b14e43ad4 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.5.0.tar.gz
-sha256 5b7cf07f6d4b19a8557cfa9ab7a0d98b9e199832694c65c8a74e928926821862  optee-examples-3.5.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.7.0.tar.gz
+sha256 6c5600871edc64dbdca08dfe40b3161bfb55a11e6004699957c6da8f67b2a475  optee-examples-3.7.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 7d08209ce8..093b8600c1 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.5.0
+OPTEE_EXAMPLES_VERSION = 3.7.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
