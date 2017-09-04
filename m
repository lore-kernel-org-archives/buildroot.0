From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon,  4 Sep 2017 17:54:06 +0200
Subject: [Buildroot] [PATCH] libmbim: bump to version 1.14.2
Message-ID: <20170904155406.6653-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New stable update in the 1.14.x series:
https://lists.freedesktop.org/archives/libmbim-devel/2017-August/000917.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 21921c9df..02efc6c95 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ca8d52a95a18cbabae8f15f83f1572316e888b6504f946e6645d24405127ab5b  libmbim-1.14.0.tar.xz
+sha256  22cafe6b8432433aa58bedcf7db71111522ce6531bfe24e8e9b6058412cd31cf  libmbim-1.14.2.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index d85f5897b..33e500e53 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.14.0
+LIBMBIM_VERSION = 1.14.2
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.13.1
