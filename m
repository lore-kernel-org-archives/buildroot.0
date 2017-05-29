From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:57:21 +0200
Subject: [Buildroot] [git commit] package/armadillo: fix download URL
Message-ID: <20170529201308.70C96827CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f3ae6c24e5517014666a0e22b050773188392e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armadillo/armadillo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 714c1b2..beb60c8 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -5,7 +5,9 @@
 ################################################################################
 
 ARMADILLO_VERSION = 6.500.4
-ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
+# upstream removed tarball from
+# http://downloads.sourceforge.net/project/arma
+ARMADILLO_SITE = https://ftp.fau.de/macports/distfiles/armadillo
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPL-2.0
