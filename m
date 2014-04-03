From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:24:44 +0200
Subject: [Buildroot] [git commit] flex: Version bump 2.5.39
Message-ID: <20140403192648.6DF5F9B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=931d9fbae78a6bb8006a2634e9322ac253cc86f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/flex-prog-ar.patch |   11 -----------
 package/flex/flex.mk            |    2 +-
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/flex/flex-prog-ar.patch b/package/flex/flex-prog-ar.patch
deleted file mode 100644
index e0626ff..0000000
--- a/package/flex/flex-prog-ar.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
---- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
-+++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
-@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)"
- 	"$(DESTDIR)$(includedir)"
- libLIBRARIES_INSTALL = $(INSTALL_DATA)
- LIBRARIES = $(lib_LIBRARIES)
--AR = ar
- ARFLAGS = cru
- libfl_a_AR = $(AR) $(ARFLAGS)
- libfl_a_LIBADD =
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 17f651b..2373d04 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLEX_VERSION = 2.5.37
+FLEX_VERSION = 2.5.39
 FLEX_SITE = http://download.sourceforge.net/project/flex
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
