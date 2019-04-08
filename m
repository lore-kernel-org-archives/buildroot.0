From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:13 -0400
Subject: [Buildroot] [PATCH] package/refpolicy: bump to version 2.20190201
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also change the site location to the non-archived URL.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/refpolicy/refpolicy.hash | 4 ++--
 package/refpolicy/refpolicy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index f341566f28..856d8cb8a2 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
-sha256 e826f7d7f899a548e538964487e9fc1bc67ca94756ebdce0bfb6532b4eb0d06b  refpolicy-2.20180114.tar.bz2
+# From https://github.com/SELinuxProject/refpolicy/releases
+sha256 ed620dc91c4e09eee6271b373f7c61a364a82ea57bd2dc86ca1f7075304e2843  refpolicy-2.20190201.tar.bz2
 
 # Locally computed
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 590e0ebd9a..78c17bad01 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-REFPOLICY_VERSION = 2.20180114
+REFPOLICY_VERSION = 2.20190201
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
-REFPOLICY_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/refpolicy/files
+REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20190201
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
 REFPOLICY_INSTALL_STAGING = YES
-- 
2.20.1
