From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:24 -0000
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20180907111524.691F581583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d193b0f88b8001b8158bed419de65544e439692f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index 920f3b74eb..dd84794366 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 cdae4489e0306938a46429824aa3511e7ec2a43f71fee8b4aa46ceea46d15888  x264-7d0ff22e8c96de126be9d3de4952edd6d1b75a8c.tar.gz
+sha256 0c43680b516f76fe3b9ecbe0efc7c2a763987213051c16c248f506851aebe6c7  x264-303c484ec828ed0d8bfe743500e70314d026c3bd.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index f2fb10c41c..31304b9eae 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 7d0ff22e8c96de126be9d3de4952edd6d1b75a8c
+X264_VERSION = 303c484ec828ed0d8bfe743500e70314d026c3bd
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
