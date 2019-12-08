From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:32 -0800
Subject: [Buildroot] [PATCH 10/11] package/semodule-utils: bump version to
 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-10-aduskett@gmail.com>
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
index 386b442618..c1a4ef1b9b 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 8083679ee634570f6e9a18632f2c2862b9134fa308b689b2e1952a369ae5d907 semodule-utils-2.9.tar.gz
+sha256 14ee2db21f36766ffbbb65770f8e7236d21675db9f0f5d40f50974711da598cf semodule-utils-3.0.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index 7102dbc5e0..ec1759ece1 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 2.9
-SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+SEMODULE_UTILS_VERSION = 3.0
+SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = COPYING
 SEMODULE_UTILS_DEPENDENCIES = libsepol
-- 
2.23.0
