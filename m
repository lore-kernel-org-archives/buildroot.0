From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:54:51 +0100
Subject: [Buildroot] [git commit] lz4: version v1.7.5
Message-ID: <20170325135456.B0DF38256F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5408fc925d06d5225a6ba7d18f71fc97cc3a813a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lz4/lz4.hash | 2 +-
 package/lz4/lz4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 1281284..5048503 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 9d4d00614d6b9dec3114b33d1224b6262b99ace24434c53487a0c8fd0b18cfed  lz4-r131.tar.gz
+sha256 0190cacd63022ccb86f44fa5041dc6c3804407ad61550ca21c382827319e7e7e  lz4-v1.7.5.tar.gz
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 9d7f56b..be891dd 100644
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
