From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 14 May 2015 01:40:17 +0300
Subject: [Buildroot] [PATCH] armadillo: bump versin to 5.100.2
Message-ID: <1431556817-20966-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the most recent version of the package.

Also it fixes static builds (see
http://autobuild.buildroot.net/results/1cc/1ccf0829c13896c000aed1956155a34844207b2f)
with commit http://sourceforge.net/p/arma/code/3569/ that was made right
before 4.400.0 release.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index d74d6b0..0046c56 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  0664caca9a9be410ba467a3f4fd7d4556ccda62a9e061f2935904be2afe22132  armadillo-4.000.4.tar.gz
+sha256  63150f12bf7c7c598ea55b7271d99fce349ff386a3dc2cae3904b244f6e35320  armadillo-5.100.2.tar.gz
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 58b8fc1..607103c 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION_MAJOR = 4.000
-ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).4
+ARMADILLO_VERSION_MAJOR = 5.100
+ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).2
 ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.1.0
