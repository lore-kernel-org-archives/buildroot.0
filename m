From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  8 Apr 2019 14:50:12 -0400
Subject: [Buildroot] [PATCH] package/semodule-utils: bump to version 2.9
In-Reply-To: <20190408185013.71465-1-aduskett@gmail.com>
References: <20190408185013.71465-1-aduskett@gmail.com>
Message-ID: <20190408185013.71465-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index be40918de6..386b442618 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 44f59c13070c637440b143ceab4dfe1efb9018b1e47828dd8789def74c1ccadf semodule-utils-2.8.tar.gz
+sha256 8083679ee634570f6e9a18632f2c2862b9134fa308b689b2e1952a369ae5d907 semodule-utils-2.9.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 480e157c6d..7102dbc5e0 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 2.8
-SEMODULE_UTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
+SEMODULE_UTILS_VERSION = 2.9
+SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = COPYING
 SEMODULE_UTILS_DEPENDENCIES = libsepol
-- 
2.20.1
