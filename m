From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:44 -0700
Subject: [Buildroot] [PATCH/NEXT: 06/11] package/checkpolicy: bump to
 version 3.2
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 55f4f09f76..c237913eaf 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 dfc7707070520c93b14fbbdfdbe081364d806bf28e3e79e10318c2594c77bbb2  checkpolicy-3.1.tar.gz
+sha256 9b1c81fa86fe3867842164448d90c8e7ea94b2987497809c65d4caa87a5c5bc8  checkpolicy-3.2.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 86eaffccb1..f8ce48c175 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.1
-CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+CHECKPOLICY_VERSION = 3.2
+CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.31.1
