From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:08 -0400
Subject: [Buildroot] [PATCH] package/checkpolicy: bump to version 2.9
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index cf38d6e2f4..9e77b9b027 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 9dec811c24b88e58c3bf741365eacf1dbb945531a2fcb8f284aacf68098194c8  checkpolicy-2.8.tar.gz
+sha256 a946c32b284532447857e4c48830f8816867c61220c8c08bdd32e6f691335f8e  checkpolicy-2.9.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 7143b2d7d2..8f1ec72549 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.8
-CHECKPOLICY_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
+CHECKPOLICY_VERSION = 2.9
+CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.20.1
