From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 11:05:14 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libtirpc: bump
 version to 1.3.2
Message-ID: <20210520090953.9C4987FFFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f488c9f16ea2903a1e9eaf31184ddf47f7971e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6e780387b4a901f243c85b5fb1dd0d12e4f0b23b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 337593bbe2..56c1d9de3f 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  882eaf4c13f0cafb83afd96cd2855638f978d755  libtirpc-1.3.1.tar.bz2
+sha1  51d75be0e5acc094a888f40042b23e128d163cb5  libtirpc-1.3.2.tar.bz2
 # Locally computed
-sha256  245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17  libtirpc-1.3.1.tar.bz2
+sha256  e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd  libtirpc-1.3.2.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 0f44aaffb6..2678c144e9 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.1
+LIBTIRPC_VERSION = 1.3.2
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
