From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 22:47:07 +0200
Subject: [Buildroot] [git commit branch/next] package/librsync: bump to
 version 2.1.0
Message-ID: <20190819204355.73F2C837F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d0f5c28b6ff9a676e374af13386c4637c46ffe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsync/librsync.hash | 2 +-
 package/librsync/librsync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 4367c92b5d..95206c39a7 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e67b9520ee84f7239be6e948795803bd95495091cc00bf6d0e8c6976032a4af1  librsync-2.0.2.tar.gz
+sha256 f701d2bab3d7471dfea60d29e9251f8bb7567222957f7195af55142cb207c653  librsync-2.1.0.tar.gz
 sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 1c408c3b17..4e42f77344 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.0.2
+LIBRSYNC_VERSION = 2.1.0
 LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
