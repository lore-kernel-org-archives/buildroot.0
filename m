From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 09:47:58 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/frotz: use gitlab
 macro
Message-ID: <20210403072612.A133180298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f512a970b1add443fd156d49429f5dd864879b69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 37e56d855d4c97cf0bb9b7699efeb0607f1af22f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/frotz/frotz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
index ce27bdf0bf..2a2865af14 100644
--- a/package/frotz/frotz.mk
+++ b/package/frotz/frotz.mk
@@ -6,7 +6,7 @@
 
 FROTZ_VERSION = 2.51
 FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
-FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
+FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
 FROTZ_DEPENDENCIES = host-pkgconf ncurses
 FROTZ_LICENSE = GPL-2.0+
 FROTZ_LICENSE_FILES = COPYING
