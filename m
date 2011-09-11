From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] ntfs-3g: remove --program-prefix
Message-ID: <20110912052635.271EB8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e837d5dfe6c40ed3e3cdf0d7c9db163b0c8c305
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntfs-3g/ntfs-3g.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 796e269..baabff2 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -7,7 +7,7 @@
 NTFS_3G_VERSION = 2010.10.2
 NTFS_3G_SOURCE = ntfs-3g-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
-NTFS_3G_CONF_OPT = --disable-ldconfig --program-prefix=""
+NTFS_3G_CONF_OPT = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,ntfs-3g))
-- 
1.7.3.4
