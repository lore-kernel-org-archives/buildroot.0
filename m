From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 May 2021 11:01:32 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/intel-gmmlib: bump version to
 21.1.3
Message-ID: <20210529090133.287390-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-gmmlib/intel-gmmlib.hash | 4 ++--
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1e8baba6c7..02d5cfef1a 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bb874b41c499abb8f6253b1834e93a02ed9744de71f2503ee9cd4100af7c1860  intel-gmmlib-19.4.1.tar.gz
-sha256 b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
+sha256  c459a95243075296c72a40674c449ffcc314ed6d21ad0291c1603dbc11f4a74e  intel-gmmlib-21.1.3.tar.gz
+sha256  b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 517fc09131..9114a2a521 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 19.4.1
+INTEL_GMMLIB_VERSION = 21.1.3
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.29.2
