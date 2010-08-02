From: Malte Starostik <m-starostik@versanet.de>
Date: Mon,  2 Aug 2010 23:08:16 +0200
Subject: [Buildroot] [PATCH 2/2] ntfsprogs needs host-pkg-config
In-Reply-To: <1280783296-18965-1-git-send-email-m-starostik@versanet.de>
References: <1280783296-18965-1-git-send-email-m-starostik@versanet.de>
Message-ID: <1280783296-18965-2-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 package/ntfsprogs/ntfsprogs.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 895a324..ecda40e 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -8,6 +8,7 @@ NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
 NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
 NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix="" --disable-crypto
 NTFSPROGS_INSTALL_STAGING:=yes
+NTFSPROGS_DEPENDENCIES:=host-pkg-config
 
 NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
 NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
-- 
1.7.1
