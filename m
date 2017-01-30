From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 30 Jan 2017 12:00:14 -0500
Subject: [Buildroot] [PATCH 1/1] sepolgen: bump to version 2.6
Message-ID: <20170130170014.10201-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/sepolgen/sepolgen.hash | 2 +-
 package/sepolgen/sepolgen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
index a377c66..b338a70 100644
--- a/package/sepolgen/sepolgen.hash
+++ b/package/sepolgen/sepolgen.hash
@@ -1,2 +1,2 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 8a1c6d3a78c9b6ad3555c74def555f65a62950bf21c111c585bfc382fec3a645  sepolgen-1.1.9.tar.gz
+sha256 6a327b1576d914e57ad796a541a7a9bcceefb14c445355559993de0fdb8e7a60  sepolgen-2.6.tar.gz
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index efecee7..137eaed 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SEPOLGEN_VERSION = 1.1.9
-SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+SEPOLGEN_VERSION = 2.6
+SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 SEPOLGEN_LICENSE = GPLv2
 SEPOLGEN_LICENSE_FILES = COPYING
 
-- 
2.9.3
