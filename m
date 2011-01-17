From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] ntfs-3g: bump to version
	2010.10.2
Message-ID: <20110117202412.CEA3089008@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6cc067d961cfd7c326bccabedca8d46ea807d5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
