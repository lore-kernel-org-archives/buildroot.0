From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] ntfsprogs: remove --program-prefix
Message-ID: <20110912052634.83C1F8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48573c70e67cd3f3aa5e7a1512a6286fb1ffb5df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
