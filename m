From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:14:56 +0200
Subject: [Buildroot] [git commit] package/gsl: bump version to 2.3
Message-ID: <20170605091751.22A2B82158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76e74030b035cbd45d59feacf25f8d5fe1bb90f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsl/gsl.hash | 2 +-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index bc33e4e..f7b1d53 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	73bc2f51b90d2a780e6d266d43e487b3dbd78945dd0b04b14ca5980fe28d2f53	gsl-1.16.tar.gz
+sha256 562500b789cd599b3a4f88547a7a3280538ab2ff4939504c8b4ac4ca25feadfb  gsl-2.3.tar.gz
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 3dd4904..41379f4 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 1.16
+GSL_VERSION = 2.3
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
