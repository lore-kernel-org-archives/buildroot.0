From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 20:34:48 +0100
Subject: [Buildroot] [git commit] package/feh: bump to version 3.5
Message-ID: <20201104192313.25127811FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72e447e251ae5967fb6a2d898e9e1212aa6a640e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 20916af640..806bca08ce 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 782463034ab0135bc8438515191f986db23a79d502154d23a7c07a7574907b7b  feh-3.4.1.tar.bz2
+sha256 388f9dcc8284031023364355e23a82c276e79ca614f2dcd64d2f927857a4531e  feh-3.5.tar.bz2
 sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 8ba9e40dd8..c1dae9db88 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.4.1
+FEH_VERSION = 3.5
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
