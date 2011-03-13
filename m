From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Mar 2011 21:42:06 +0100
Subject: [Buildroot] [git commit master 1/1] grub: fix download URL
Message-ID: <20110313204644.45CAB8FFFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=950ee4585b7d941c264cbe2b597845fcb5e3eef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Debian package snapshot service moved to an official debian.org
address last year (http://www.debian.org/News/2010/20100412) with a
slightly different URL structure, so adjust the download URL to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/grub/grub.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 401d346..9461d1c 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -5,7 +5,7 @@
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
 GRUB_PATCH:=grub_0.97-35.diff.gz
-GRUB_SITE:=http://snapshot.debian.net/archive/2008/03/29/debian/pool/main/g/grub/
+GRUB_SITE:=http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
 GRUB_PATCH_SITE:=$(GRUB_SITE)
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
-- 
1.7.3.4
