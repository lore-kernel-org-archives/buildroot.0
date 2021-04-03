From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  3 Apr 2021 14:42:30 +0200
Subject: [Buildroot] [PATCH] package/jimtcl: bump to version 0.80
Message-ID: <20210403124230.161485-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/jimtcl/jimtcl.hash | 4 ++--
 package/jimtcl/jimtcl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jimtcl/jimtcl.hash b/package/jimtcl/jimtcl.hash
index 21d75c4f4..7960f4fdd 100644
--- a/package/jimtcl/jimtcl.hash
+++ b/package/jimtcl/jimtcl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	ab8204cd03b946f5149e1273af9c86d8e73b146084a0fbeb1d4f41a75b0b3411	jimtcl-0.79.tar.gz
-sha256	419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950	LICENSE
+sha256  9e79a960de925552eeb4df51121f0ea017e34409568117b1ac461f4c3071289e  jimtcl-0.80.tar.gz
+sha256  419f1146334e57fb258d6c957d1f94d43455ec0d24b1b54c4447e5f61a353950  LICENSE
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e712dff0b..5d6b37926 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.79
+JIMTCL_VERSION = 0.80
 JIMTCL_SITE = $(call github,msteveb,jimtcl,$(JIMTCL_VERSION))
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2-Clause
-- 
2.27.0
