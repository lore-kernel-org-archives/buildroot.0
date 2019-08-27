From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 27 Aug 2019 20:41:45 +0200
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.18.2
Message-ID: <20190827184145.22435-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
$ ./utils/test-pkg -p libmbim
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK


 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 9e8629f341..3cb1245ec9 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  6cf40128d83d087946a7d8577e735526202e034d52f90047735329609097b282  libmbim-1.18.0.tar.xz
+sha256  7723f2ca2286c5286ffba7331cb4520099982e55355a7af6f45bdce6b5d39268  libmbim-1.18.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 748d215537..1e2f7fc162 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.18.0
+LIBMBIM_VERSION = 1.18.2
 LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.22.0
