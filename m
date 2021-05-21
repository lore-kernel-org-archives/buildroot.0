From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 12:02:44 +0200
Subject: [Buildroot] [git commit branch/next] package/libsemanage: bump to
 version 3.2
Message-ID: <20210521093436.E1050886E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d04944b0c5f0003bd1b4df422c09a0b4653e7ed9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@collins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index a977ddabc6..117fd40d6a 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 22d6c75526e40d1781c30bcf29abf97171bdfe6780923f11c8e1c76a75a21ff8 libsemanage-3.1.tar.gz
+sha256 d722a55ca4fe2d4e2b30527720db657e6238b28079e69e2e4affeb8e733ee511 libsemanage-3.2.tar.gz
 
 # Hash for license file
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 48e2bbbc8b..bbe976a2c9 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.1
-LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+LIBSEMANAGE_VERSION = 3.2
+LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
