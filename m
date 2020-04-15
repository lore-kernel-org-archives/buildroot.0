From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Apr 2020 07:59:18 -0500
Subject: [Buildroot] [PATCH v4 5/8] package/restorecond: bump version to 3.0
In-Reply-To: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200415125921.57648-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v3 -> v4
 - Switched back to using x.y for versioning

v2 -> v3
 - Matt switched over the versioning to use dates
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
2.17.1
