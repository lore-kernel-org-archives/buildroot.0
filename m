From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 22:35:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/armadillo: fix download URL
Message-ID: <20170528203552.7479-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/armadillo/armadillo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 714c1b2dd..beb60c8c6 100644
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
-- 
2.11.0
