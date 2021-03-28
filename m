From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 22:44:57 +0200
Subject: [Buildroot] [git commit] package/frotz: use gitlab macro
Message-ID: <20210328202028.7BBBF867A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37e56d855d4c97cf0bb9b7699efeb0607f1af22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/frotz/frotz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index cc0421358c..c1362b2ac6 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -6,7 +6,7 @@
 
 FROTZ_VERSION = 2.53
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
-FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
+FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
 FROTZ_LICENSE = GPL-2.0+
 FROTZ_LICENSE_FILES = COPYING
