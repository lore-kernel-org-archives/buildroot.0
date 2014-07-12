From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jul 2014 20:48:39 +0200
Subject: [Buildroot] [git commit] ncmpc: bump to version 0.23
Message-ID: <20140714111212.8DC739D235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8957080d6d9626e2a27a9950d209d2cad9a2f1f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncmpc/ncmpc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 21ac0ae..c006af2 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).21
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).23
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.gz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
