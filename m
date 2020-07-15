From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 15 Jul 2020 15:07:37 +0200
Subject: [Buildroot] [PATCH 6/9] package/restorecond: bump to 20200710
In-Reply-To: <20200715130740.775804-1-antoine.tenart@bootlin.com>
References: <20200715130740.775804-1-antoine.tenart@bootlin.com>
Message-ID: <20200715130740.775804-7-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 7532bbf05487..e30e62a8128b 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 32a92c9f4bf48c613f9f467ced58d8c369eec8892239cd44d5d0e139b41926dc restorecond-3.0.tar.gz
+sha256 82ca45099685a45d718f11f8859963c1ba83d98e510312cbf0b7dc5664c60ad0 restorecond-3.1.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 0cf0ec35e9c5..7ab7e978ddce 100644
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
 
-- 
2.26.2
