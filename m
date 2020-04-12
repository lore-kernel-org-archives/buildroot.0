From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:14:51 +0200
Subject: [Buildroot] [git commit] package/openblas: bump version to 0.3.9
Message-ID: <20200412210109.D28578E8B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e7022d291c8411c31e7651c2792e3f25f47ee9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.openblas.net/Changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openblas/openblas.hash | 2 +-
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 0683d2a646..c58def9d5d 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f86ade36f0dbed9ac90eb62575137388359d97d8f93093b38abe166ad7ef3a8  openblas-0.3.8.tar.gz
+sha256  17d4677264dfbc4433e97076220adc79b050e4f8a083ea3f853a53af253bc380  openblas-0.3.9.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 105c03713b..9701df9148 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.8
+OPENBLAS_VERSION = 0.3.9
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
