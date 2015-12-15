From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:36:58 +0100
Subject: [Buildroot] [git commit] popt: change POPT_SITE back to original url
Message-ID: <20151215203912.0DB3581974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a54cde49d51f25b135a3751965e6c59b79d2cddc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The popt-1.16.tar.gz file is no more available at current URL and
rmp5.org is online.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.hash | 2 +-
 package/popt/popt.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/popt/popt.hash b/package/popt/popt.hash
index 4d93e47..875bbae 100644
--- a/package/popt/popt.hash
+++ b/package/popt/popt.hash
@@ -1,2 +1,2 @@
-# Locally calculated based on http://anduin.linuxfromscratch.org/sources/BLFS/svn/p/popt-1.16.tar.gz.md5sum
+# Locally calculated:
 sha256	e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8	popt-1.16.tar.gz
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 605649b..863a47a 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 POPT_VERSION = 1.16
-# rpm5.org down
-POPT_SITE = http://anduin.linuxfromscratch.org/sources/BLFS/svn/p
+POPT_SITE = http://rpm5.org/files/popt
 POPT_INSTALL_STAGING = YES
 POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
