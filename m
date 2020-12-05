From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:23:03 +0100
Subject: [Buildroot] [git commit] package/iw: bump version to 5.9
Message-ID: <20201205201041.5F6B380258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4c0224563ac7ae9695ec1ea16ace47641b3c087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 0aa51563f1..126b1cb673 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  a2469f677088d7b1070a7fbb28f3c747041697e8f6ec70783339cb1bc27a395f  iw-5.4.tar.xz
+sha256  293a07109aeb7e36267cf59e3ce52857e9ffae3a6666eb8ac77894b1839fe1f2  iw-5.9.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2250ea413b..9f4095e9dc 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.4
+IW_VERSION = 5.9
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
