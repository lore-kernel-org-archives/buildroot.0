From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 21:48:31 +0100
Subject: [Buildroot] [git commit] package/libtirpc: bump version to 1.3.1
Message-ID: <20201229203134.2206F822C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7da9b8644a4f7cdb94431349c089acc7f1c81550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr:
  - fix filename for sha256 entry
  - two spaces in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtirpc/libtirpc.hash | 6 +++---
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index e437554285..337593bbe2 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1 f182235e32942fc0ac6b9b5b6fe7e32f69362659  libtirpc-1.2.6.tar.bz2
+sha1  882eaf4c13f0cafb83afd96cd2855638f978d755  libtirpc-1.3.1.tar.bz2
 # Locally computed
-sha256 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc  libtirpc-1.2.6.tar.bz2
-sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
+sha256  245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17  libtirpc-1.3.1.tar.bz2
+sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index f1bdc32eba..5371d20488 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.2.6
+LIBTIRPC_VERSION = 1.3.1
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
