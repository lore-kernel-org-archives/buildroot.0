From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:37:20 +0100
Subject: [Buildroot] [git commit] libtool: bump to version 2.4.6
Message-ID: <20150302222719.83ADE807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f290046f66b714e9e4670e85e618c72f11745ca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.hash |    2 +-
 package/libtool/libtool.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index 06a562d..baaac61 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	84aac136513b009278896ffa255e4d685bcdb0cb0e5363be36adad64c986177e	libtool-2.4.5.tar.xz
+sha256	7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f	libtool-2.4.6.tar.xz
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 3332cfc..28786d2 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.5
+LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
