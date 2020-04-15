From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Apr 2020 07:59:20 -0500
Subject: [Buildroot] [PATCH v4 7/8] package/checkpolicy: bump version to 3.0
In-Reply-To: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
References: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200415125921.57648-8-matthew.weber@rockwellcollins.com>
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
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 9e77b9b027..264e21b8f3 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 a946c32b284532447857e4c48830f8816867c61220c8c08bdd32e6f691335f8e  checkpolicy-2.9.tar.gz
+sha256 c88c719a141dd5c1202d49c378c7f063349d630522d5e04dc6e0c53da81aa4f8  checkpolicy-3.0.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 8f1ec72549..3b055df489 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 2.9
-CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+CHECKPOLICY_VERSION = 3.0
+CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.17.1
