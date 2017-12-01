From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:21:35 +0100
Subject: [Buildroot] [git commit] package/feh: Bump to version 2.22.2
Message-ID: <20171201211635.76E3382591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf6c97a7fbd3ca799c1dba2710e8c153b4122597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index f3f7ced..0f8ac8c 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 520481c9908d999f8f7546103b78ff9b11f41d25b0938f0a22f10aaa48beef2b  feh-2.21.tar.bz2
+sha256 05a81fbe0997f6274c7617efc351647be38e5244c2624bd203459025c9a68ecd  feh-2.22.2.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 3442f57..311cef3 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.21
+FEH_VERSION = 2.22.2
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
