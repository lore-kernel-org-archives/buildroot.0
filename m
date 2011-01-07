From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Jan 2011 17:13:00 -0300
Subject: [Buildroot] [PATCH 11/13] ntfs-3g: bump to version 2010.10.2
In-Reply-To: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294431182-27793-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/ntfs-3g.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index a372d42..796e269 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -3,10 +3,11 @@
 # ntfs-3g
 #
 #############################################################
-NTFS_3G_VERSION:=2009.3.8
-NTFS_3G_SOURCE:=ntfs-3g-$(NTFS_3G_VERSION).tgz
-NTFS_3G_SITE:=http://www.ntfs-3g.org/
-NTFS_3G_CONF_OPT:=--disable-ldconfig --program-prefix=""
-NTFS_3G_INSTALL_STAGING:=yes
+
+NTFS_3G_VERSION = 2010.10.2
+NTFS_3G_SOURCE = ntfs-3g-$(NTFS_3G_VERSION).tgz
+NTFS_3G_SITE = http://tuxera.com/opensource
+NTFS_3G_CONF_OPT = --disable-ldconfig --program-prefix=""
+NTFS_3G_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,ntfs-3g))
-- 
1.7.2.2
