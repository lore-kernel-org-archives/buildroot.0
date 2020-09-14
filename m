From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:13:11 +0200
Subject: [Buildroot] [git commit] package/systemd: bump version to 246.5
Message-ID: <20200914190421.177C3862D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea2c2190b3348f86458a205a59befbdc3fdb2566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.hash | 4 ++--
 package/systemd/systemd.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 4672e43422..cad249199c 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  4268bd88037806c61c5cd1c78d869f7f20bf7e7368c63916d47b5d1c3411bd6f  systemd-246.tar.gz
+sha256  f45c5a98d3be7dd05ed7f1e1a0ab00c7ba52602aa2dc42615bf74be61fcbe178  systemd-246.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  a5ce42cd4614b086ef75aae6663f88f55bdf9e09a83c615c636ca540282528cf  README
+sha256  b142af99a3d950fb465326d6fd5a49d348523dc0d216682880527264d0a011e9  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d72cb58693..30e28adf95 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 246
-SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
+SYSTEMD_VERSION = 246.5
+SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
 SYSTEMD_INSTALL_STAGING = YES
