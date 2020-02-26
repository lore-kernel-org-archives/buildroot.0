From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Feb 2020 14:03:23 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/openblas: bump to version 0.3.8
Message-ID: <20200226130323.1898464-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openblas/openblas.hash | 4 ++--
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 5b1fb17fa7..0683d2a646 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bde136122cef3dd6efe2de1c6f65c10955bbb0cc01a520c2342f5287c28f9379  openblas-0.3.7.tar.gz
-sha256 190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
+sha256  8f86ade36f0dbed9ac90eb62575137388359d97d8f93093b38abe166ad7ef3a8  openblas-0.3.8.tar.gz
+sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index f068402269..105c03713b 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.7
+OPENBLAS_VERSION = 0.3.8
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.25.0
