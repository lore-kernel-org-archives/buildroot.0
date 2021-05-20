From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:45 -0700
Subject: [Buildroot] [PATCH/NEXT: 07/11] package/restorecond: bump to
 version 3.2
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index e30e62a812..1869100188 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 82ca45099685a45d718f11f8859963c1ba83d98e510312cbf0b7dc5664c60ad0 restorecond-3.1.tar.gz
+sha256 471c17e64aa6d7226e861d4d0125d15fdf9b38892c542be32bd83d999e5e75f5 restorecond-3.2.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 7ab7e978dd..d08e0a722e 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.1
-RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+RESTORECOND_VERSION = 3.2
+RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = COPYING
 
-- 
2.31.1
