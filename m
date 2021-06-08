From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:23:21 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/expat: bump to
 version 2.3.0
Message-ID: <20210608075704.B1F7081024@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c9fd339347f8d5ac6e8c3e84f03b96398e9c5a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://github.com/libexpat/libexpat/blob/R_2_3_0/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f2720836b7701225613ca89b676571fa254cd4d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 5a8dd41280..dd448982fe 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.10/
-md5  e0fe49a6b3480827c9455e4cfc799133  expat-2.2.10.tar.xz
-sha1  a333b95121a718a77ee481dbade5efcd72a32eb8  expat-2.2.10.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.3.0/
+md5  1c1b523a8d917e6d9f7af4f8881d8ec5  expat-2.3.0.tar.xz
+sha1  596a37d048b357a58990a538a8d83e2e38325122  expat-2.3.0.tar.xz
 
 # Locally calculated
-sha256  5dfe538f8b5b63f03e98edac520d7d9a6a4d22e482e5c96d4d06fcc5485c25f2  expat-2.2.10.tar.xz
+sha256  caa34f99b6e3bcea8502507eb6549a0a84510b244a748dfb287271b2d47467a9  expat-2.3.0.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 4acbade2c8..04ea413e1b 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.10
+EXPAT_VERSION = 2.3.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
