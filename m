From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:19:27 +0200
Subject: [Buildroot] [git commit] feh: fix typo in xlib_libXinerama
 dependency
Message-ID: <20180912191909.059F4863C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04d7572a8533afa684a9ba8fbabcff7aaf85aa1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This typo was introduced by commit
de2fe74e2ae9ed0ac0bfa6a32879c02ec8e1cb92, and was noticed by Petr
Vorel.

Reported-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/feh/feh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 6cfa73b242..ff611924d9 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -19,7 +19,7 @@ FEH_MAKE_OPTS += curl=0
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-FEH_DEPENDENCIES += xlib_libXinemara
+FEH_DEPENDENCIES += xlib_libXinerama
 FEH_MAKE_OPTS += xinerama=1
 else
 FEH_MAKE_OPTS += xinerama=0
