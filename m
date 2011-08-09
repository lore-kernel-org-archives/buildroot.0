From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:46 +0200
Subject: [Buildroot] [PATCH 13/22] ntfsprogs: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-13-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/ntfsprogs/ntfsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 4557747..ea8a2a4 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -6,7 +6,7 @@
 NTFSPROGS_VERSION:=2.0.0
 NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
 NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
-NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix="" --disable-crypto
+NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --disable-crypto
 NTFSPROGS_INSTALL_STAGING:=yes
 
 NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
-- 
1.7.2.5
