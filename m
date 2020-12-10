From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:02:11 +0100
Subject: [Buildroot] [git commit] package/libsoundtouch: bump version to 2.2
Message-ID: <20201210204842.CD0F881019@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0456531966903d6d21e07e564eda3db06f925a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://gitlab.com/soundtouch/soundtouch/-/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index aa33bb8a7e..fe6a108e33 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a431facf019f37cc2da112156226d686e941b15d6327f3a41d7ca21dfaf8e94  libsoundtouch-2.1.2.tar.gz
+sha256  f1ce96bac35779d3b752f4cc8696975b3d58f3deb9db47ffc45862767c2a2bdd  libsoundtouch-2.2.tar.gz
 sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 9b040e391c..98b5cc75b3 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.1.2
+LIBSOUNDTOUCH_VERSION = 2.2
 LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
