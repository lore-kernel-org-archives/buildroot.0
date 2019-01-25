From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:38:40 +0100
Subject: [Buildroot] [git commit] package/libmbim: bum to version 1.18.0
Message-ID: <20190125144019.0BB4081312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c91e9e0fd43dcad7bfc67338272972bf04b4057a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 9364183080..9e8629f341 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  eb494fee2c200daf4f5cc8a40061d24a3dfafe8c59151c95c6a826fd96dcb262  libmbim-1.16.2.tar.xz
+sha256  6cf40128d83d087946a7d8577e735526202e034d52f90047735329609097b282  libmbim-1.18.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 9d74b108ca..748d215537 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.16.2
+LIBMBIM_VERSION = 1.18.0
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
