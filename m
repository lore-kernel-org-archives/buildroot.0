From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Apr 2021 14:54:55 +0200
Subject: [Buildroot] [git commit] package/feh: bump version to 3.6.3
Message-ID: <20210430122803.7E88E86358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7dd48babcacb53b56c386454ae1cacb1e26c778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 806bca08ce..3a2296ac23 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 388f9dcc8284031023364355e23a82c276e79ca614f2dcd64d2f927857a4531e  feh-3.5.tar.bz2
+sha256 437420f37f11614e008d066e2a3bdefcfc78144c8212998b2bacdd5d21ea23b4  feh-3.6.3.tar.bz2
 sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index c1dae9db88..df59e67d52 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.5
+FEH_VERSION = 3.6.3
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
