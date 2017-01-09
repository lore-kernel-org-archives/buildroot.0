From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 11:15:23 -0500
Subject: [Buildroot] [5/5] policycoreutils: bump version to 2.6
In-Reply-To: <20170109161523.6855-1-aduskett@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
Message-ID: <20170109161523.6855-5-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 44cb0c3..999a778 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,2 +1,2 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 329382cfe9fa977678abf541dcd8fe3847cf0c83b24654c8f7322343907078a1 policycoreutils-2.5.tar.gz
+sha256 68891b376f5048edc53c6ccb2fca44da3dc7f4563f4b6894e201d70c04a05a29 policycoreutils-2.6.tar.gz
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 86639cc..6076bb9 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 2.5
-POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+POLICYCOREUTILS_VERSION = 2.6
+POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 POLICYCOREUTILS_LICENSE = GPLv2
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
-- 
2.9.3
