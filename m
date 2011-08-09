From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:49 +0200
Subject: [Buildroot] [PATCH 16/22] ntfs-3g: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-16-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
1.7.2.5
