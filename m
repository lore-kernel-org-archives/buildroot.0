From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:25:33 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libconfuse: bump
 version to 3.3
Message-ID: <20200716163656.F33CF87083@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e2b980d29b2364f0750595f85e294764cf75903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This fixes a possible loop-forever bug.

Release notes:
https://github.com/martinh/libconfuse/releases/tag/v3.3

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2747d967144a641bccd143bd2e6ccd878dec321c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libconfuse/libconfuse.hash | 6 +++---
 package/libconfuse/libconfuse.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index adc93f99a3..bb968f7a52 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,5 +1,5 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.2.2/confuse-3.2.2.tar.xz.md5
-md5  978996e421e5005e6a9f6f84948fac44  confuse-3.2.2.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.3/confuse-3.3.tar.xz.md5
+md5  a183cef2cecdd3783436ff8de500d274  confuse-3.3.tar.xz
 # Locally computed
-sha256  a9240b653d02e8cfc52db48e8c4224426e528e1faa09b65e8ca08a197fad210b  confuse-3.2.2.tar.xz
+sha256  1dd50a0320e135a55025b23fcdbb3f0a81913b6d0b0a9df8cc2fdf3b3dc67010  confuse-3.3.tar.xz
 sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index b16bc9b7a7..516c0056d1 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.2.2
+LIBCONFUSE_VERSION = 3.3
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
