From: Jeroen Roovers <jer@airfi.aero>
Date: Fri, 24 Mar 2017 07:29:52 +0100
Subject: [Buildroot] [PATCH] lz4: version v1.7.5
Message-ID: <20170324062952.21759-1-jer@airfi.aero>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
---
 package/lz4/lz4.hash | 2 +-
 package/lz4/lz4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 128128469..5048503f8 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 9d4d00614d6b9dec3114b33d1224b6262b99ace24434c53487a0c8fd0b18cfed  lz4-r131.tar.gz
+sha256 0190cacd63022ccb86f44fa5041dc6c3804407ad61550ca21c382827319e7e7e  lz4-v1.7.5.tar.gz
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 9d7f56bbf..be891dd1a 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LZ4_VERSION = r131
-LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
+LZ4_VERSION = v1.7.5
+LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c (library), GPLv2+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
-- 
2.12.1
