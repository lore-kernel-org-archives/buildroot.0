From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 08:52:33 +0200
Subject: [Buildroot] [git commit] package/tvheadend: Bump version to current
	git master
Message-ID: <20140726065738.951B59D2A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d93a7bfd61d6fe02adca7d72f07dc735d2a22d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../tvheadend/tvheadend-003-remove-werror.patch    |    8 ++++----
 package/tvheadend/tvheadend.mk                     |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/tvheadend-003-remove-werror.patch b/package/tvheadend/tvheadend-003-remove-werror.patch
index cc97a18..039e0e0 100644
--- a/package/tvheadend/tvheadend-003-remove-werror.patch
+++ b/package/tvheadend/tvheadend-003-remove-werror.patch
@@ -5,12 +5,12 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
 --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:50:48.437688482 +0100
 +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:54:00.411418749 +0100
-@@ -27,7 +27,7 @@
- # Common compiler flags
+@@ -28,7 +28,7 @@
  #
  
+ CFLAGS  += -g -O2
 -CFLAGS  += -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
 +CFLAGS  += -Wall -Wwrite-strings -Wno-deprecated-declarations
- CFLAGS  += -Wmissing-prototypes -fms-extensions
- CFLAGS  += -g -funsigned-char -O2
+ CFLAGS  += -Wmissing-prototypes
+ CFLAGS  += -fms-extensions -funsigned-char -fno-strict-aliasing
  CFLAGS  += -D_FILE_OFFSET_BITS=64
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 4d0a16d..bd52ecd 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = fd24558503967375d0b9058ac2a4c594de971cd2
+TVHEADEND_VERSION = f72733ff08be069620e7247e191d4f0899a2638a
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE.md
