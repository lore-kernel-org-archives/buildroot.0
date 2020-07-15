From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:12:55 +0200
Subject: [Buildroot] [git commit] package/restorecond: bump to 20200710
Message-ID: <20200715151043.70D1F85B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc1c468a3658497c860e86fb0e7327ec8289209f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 7532bbf054..e30e62a812 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 32a92c9f4bf48c613f9f467ced58d8c369eec8892239cd44d5d0e139b41926dc restorecond-3.0.tar.gz
+sha256 82ca45099685a45d718f11f8859963c1ba83d98e510312cbf0b7dc5664c60ad0 restorecond-3.1.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 0cf0ec35e9..7ab7e978dd 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.0
-RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
+RESTORECOND_VERSION = 3.1
+RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = COPYING
 
