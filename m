From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:30:02 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/armadillo: fix
	download URL
Message-ID: <20170601144623.E758E8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9ed7236ff5cd877e1ffa84d3700a20b8cd4d413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 96f3ae6c24e5517014666a0e22b050773188392e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/armadillo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 813a41b..00ba08a 100644
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
 ARMADILLO_LICENSE = MPLv2.0
