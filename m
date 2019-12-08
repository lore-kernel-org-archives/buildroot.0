From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:31 -0800
Subject: [Buildroot] [PATCH 09/11] package/restorecond: bump version to 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 7a82bda370..7532bbf054 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 cbf9820583e641ee0462fa7bc89e6024676af281e025703e17b2d019b1a25a4f restorecond-2.9.tar.gz
+sha256 32a92c9f4bf48c613f9f467ced58d8c369eec8892239cd44d5d0e139b41926dc restorecond-3.0.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index c519b5de2b..0cf0ec35e9 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 2.9
-RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+RESTORECOND_VERSION = 3.0
+RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = COPYING
 
-- 
2.23.0
