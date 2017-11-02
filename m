From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 21:23:32 +0100
Subject: [Buildroot] [git commit] package/feh: Bump to version 2.21
Message-ID: <20171102201710.6C7A57FD8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=233242baed3ea1d980f23e53d8317b86b8114e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index c11ff64..f3f7ced 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 d82f68c7a96e1860dab3584ed58bda69446b692ae79a4ca999018507da310563  feh-2.18.3.tar.bz2
+sha256 520481c9908d999f8f7546103b78ff9b11f41d25b0938f0a22f10aaa48beef2b  feh-2.21.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index ac8f683..3f4c410 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.18.3
+FEH_VERSION = 2.21
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
