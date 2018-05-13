From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:44:44 +0200
Subject: [Buildroot] [git commit branch/next] feh: Bump to version 2.26
Message-ID: <20180513204410.4674E8B892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e2c9b39084f5ed48016c1c8bb4a83a41b05c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 0f8ac8c0b0..0653fc2eee 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 05a81fbe0997f6274c7617efc351647be38e5244c2624bd203459025c9a68ecd  feh-2.22.2.tar.bz2
+sha256 b1d6bfdd79060d864b8eff05b916153be04801998148620125e3ac31f99f6c86  feh-2.26.tar.bz2
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 311cef3afb..0bbec23111 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.22.2
+FEH_VERSION = 2.26
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
