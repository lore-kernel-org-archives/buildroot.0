From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:34:45 +0200
Subject: [Buildroot] [git commit] package/optee-examples: bump to version
 3.9.0
Message-ID: <20200714133102.0136C82295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a97e503932187b3ef22113ac37675bb0c5837cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump OP-TEE Examples package version to OP-TEE release 3.9.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 8b14e43ad4..ff7a49a6cb 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.7.0.tar.gz
-sha256 6c5600871edc64dbdca08dfe40b3161bfb55a11e6004699957c6da8f67b2a475  optee-examples-3.7.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.9.0.tar.gz
+sha256 deb5161ac9b9c1bf12963d28992e3941452a78bcbd518169b53c0798393eb386  optee-examples-3.9.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 093b8600c1..d48707216b 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.7.0
+OPTEE_EXAMPLES_VERSION = 3.9.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
