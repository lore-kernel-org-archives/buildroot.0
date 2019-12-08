From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:25:05 +0100
Subject: [Buildroot] [git commit] package/isl: bump to version 0.22
Message-ID: <20191208221636.B3AE988F2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3339961957dead9a536b74aa2df6947511c5482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/isl/isl.hash | 3 ++-
 package/isl/isl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 43e5a463af..40d04dca80 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	0f35051cc030b87c673ac1f187de40e386a1482a0cfdf2c552dd6031b307ddc4	isl-0.18.tar.xz
+sha256	6c8bc56c477affecba9c59e2c9f026967ac8bad01b51bdd07916db40a517b9fa	isl-0.22.tar.xz
+sha256	3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30	LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index b5f01c4c8d..a1a597d038 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.18
+ISL_VERSION = 0.22
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
