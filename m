From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:46:58 +0200
Subject: [Buildroot] [git commit] package/librsync: bump to version 2.3.2
Message-ID: <20210421202016.6E9FE843AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ab117d35a0fec4e397590881408172e83117866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a patch release that fixes some minor bugs, tidies the code for
many compiler warnings, and improves windows compatibility. Upgrading
from v2.3.1 is recommended for most people, and essential for people
using platforms experiencing bugs #214 or #207.

https://github.com/librsync/librsync/releases/tag/v2.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/librsync/librsync.hash | 2 +-
 package/librsync/librsync.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 1b2130b1a4..c8ca61e516 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dbd7eb643665691bdf4009174461463737b19b4814b789baad62914cabfe4569  librsync-2.3.1.tar.gz
+sha256  ef8ce23df38d5076d25510baa2cabedffbe0af460d887d86c2413a1c2b0c676f  librsync-2.3.2.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index bb36cb657c..97f5c607b0 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.3.1
-LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
+LIBRSYNC_VERSION = 2.3.2
+LIBRSYNC_SITE = https://github.com/librsync/librsync/releases/download/v$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_CPE_ID_VENDOR = librsync_project
