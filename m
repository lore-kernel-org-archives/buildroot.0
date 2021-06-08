From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jun 2021 10:23:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/expat: security
 bump to version 2.4.1
Message-ID: <20210608075704.C254588390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10405de4567b33e1fd32e39a037f131da0c6c977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2013-0340 "Billion Laughs":
https://blog.hartwork.org/posts/cve-2013-0340-billion-laughs-fixed-in-expat-2-4-0/

https://github.com/libexpat/libexpat/blob/R_2_4_1/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 990d0c1cd282674adf09da316568678bafa505c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index dd448982fe..8cf563d8f5 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.3.0/
-md5  1c1b523a8d917e6d9f7af4f8881d8ec5  expat-2.3.0.tar.xz
-sha1  596a37d048b357a58990a538a8d83e2e38325122  expat-2.3.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.1/
+md5  a4fb91a9441bcaec576d4c4a56fa3aa6  expat-2.4.1.tar.xz
+sha1  7988e4df355162500f09837aa95cbb48e6754420  expat-2.4.1.tar.xz
 
 # Locally calculated
-sha256  caa34f99b6e3bcea8502507eb6549a0a84510b244a748dfb287271b2d47467a9  expat-2.3.0.tar.xz
+sha256  cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a  expat-2.4.1.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 04ea413e1b..bb1cfd8c8a 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.3.0
+EXPAT_VERSION = 2.4.1
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
