From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 21:42:47 +0200
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.82
Message-ID: <20170719193838.EB3DB80539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c984aa684291784abf49dc33e4661826eecdb8d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 247e631..f864c55 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-May/142708.html
-md5 d04f3567f0a812188d06f860fded5ab7  libdrm-2.4.81.tar.bz2
-sha1 40f0994b5fb9992e6f55d3a14537def21719d896  libdrm-2.4.81.tar.bz2
-sha256 8cc05c195ac8708199979a94c4e4d1a928c14ec338ecbcb38ead09f54dae11ae  libdrm-2.4.81.tar.bz2
-sha512 5f7a1524acad59890d3f890bed90a660a424e18a88d587ca356223bde4a7446d1c540f97ec11cb10d2e7ed1b4ae86127957634354a1be6d04199295ab24782e5  libdrm-2.4.81.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-July/147750.html
+md5 29867814123c3d23056b1d05aada1b9d  libdrm-2.4.82.tar.bz2
+sha1 c42ff308db6352eaf009a8209c7aaadbc951a89f  libdrm-2.4.82.tar.bz2
+sha256 43fa2dbd422d6d41ac141272cc9855360ce4d08c7cf7f2c7bb55dfe449c4ce1c  libdrm-2.4.82.tar.bz2
+sha512 e69fd8c2b392daabbb3a548179e3a21a555d5174c11d76a288eb2a08850849aa867c7777b67798ec00e026e998a3b128c22698f05a7b44eb24cddc5c8a3a02d0  libdrm-2.4.82.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 54187f3..0175dc9 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.81
+LIBDRM_VERSION = 2.4.82
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
