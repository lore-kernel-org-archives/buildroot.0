From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:13:20 +0200
Subject: [Buildroot] [git commit] package/gqrx: bump version to 2.6.1
Message-ID: <20170605091447.83A5480142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d7a56587487b42fd0ce056e1ef07b301d39f513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 2d126aa..bb52a61 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 53d25db8d987a41ccccaf6fd85262bd7770cdfab5539b5901c4558756483c9db  gqrx-v2.6.tar.gz
+sha256 2736a963dac4051ca8ae91a440ee6643ef7d26c9de5b9c83a369d5fc9328d453  gqrx-v2.6.1.tar.gz
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 12e79ed..2a7651c 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = v2.6
+GQRX_VERSION = v2.6.1
 GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
