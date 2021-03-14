From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 11:59:07 +0100
Subject: [Buildroot] [git commit] package/psmisc: bump version to 23.4
Message-ID: <20210314103653.266468795C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae2f4763f6da52098e136c73b1b44d28c572386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog ([1]):

  Changes in 23.4
  ===============
    * killall: Dynamically link to selinux and use security attributes
    * pstree: Do not crash on missing processes !21
    * pstree: fix layout when using -C !24
    * pstree: add time namespace !25
    * pstree: Dynamically link to selinux and use attr
    * fuser: Get less confused about duplicate dev_id !10
    * fuser: Only check pathname on non-block devices !31

  Changes in 23.3
  ===============
    * killall: check also truncated 16 char comm names Debian #912748
    * fuser: Return early if have nulls !18
    * peekfd: Add support for ARM64 !19
    * pstree: Add color by age #21
    * fuser: Use larger inode sizes #16

[1] https://gitlab.com/psmisc/psmisc/-/blob/master/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/psmisc/psmisc.hash | 6 +++---
 package/psmisc/psmisc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index 8e380a5591..47e44f6921 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/psmisc/files/psmisc/
-md5 0524258861f00be1a02d27d39d8e5e62 psmisc-23.2.tar.xz
-sha1 2bf3ec1c87ab3bc0610c819452c21cf4b849b0b8 psmisc-23.2.tar.xz
+md5  8114cd4489b95308efe2509c3a406bbf  psmisc-23.4.tar.xz
+sha1  a4c34111e570c43967efb2bbd8a4f31d94d22e0f  psmisc-23.4.tar.xz
 # Locally computed:
-sha256  4b7cbffdc9373474da49b85dc3457ae511c43dc7fa7d94513fe06f89dcb87880  psmisc-23.2.tar.xz
+sha256  7f0cceeace2050c525f3ebb35f3ba01d618b8d690620580bdb8cd8269a0c1679  psmisc-23.4.tar.xz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index e9a7b00c9d..3d0d2c5367 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSMISC_VERSION = 23.2
+PSMISC_VERSION = 23.4
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
 PSMISC_SOURCE = psmisc-$(PSMISC_VERSION).tar.xz
 PSMISC_LICENSE = GPL-2.0+
