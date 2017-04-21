From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Apr 2017 10:44:02 +0100
Subject: [Buildroot] [PATCH] opencv3: bump version to 3.2.0
Message-ID: <20170421094402.6686-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to the official GitHub.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv3/opencv3.hash | 2 +-
 package/opencv3/opencv3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 20859ea..6720028 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f00b3c4f42acda07d89031a2ebb5ebe390764a133502c03a511f67b78bbd4fbf  opencv3-3.1.0.tar.gz
+sha256 b9d62dfffb8130d59d587627703d5f3e6252dce4a94c1955784998da7a39dd35  opencv3-3.2.0.tar.gz
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 10e0dfe..2e50ba2 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.1.0
-OPENCV3_SITE = $(call github,itseez,opencv,$(OPENCV3_VERSION))
+OPENCV3_VERSION = 3.2.0
+OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
 OPENCV3_LICENSE_FILES = LICENSE
-- 
2.10.2
