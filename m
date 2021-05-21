From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 12:02:53 +0200
Subject: [Buildroot] [git commit branch/next] package/restorecond: bump to
 version 3.2
Message-ID: <20210521093437.1E66E886E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2cc73b0064fa68e770b57bb6d0d80457a6f251d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Matthew Weber <matthew.weber@collins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
