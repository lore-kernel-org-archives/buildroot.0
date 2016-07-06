From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 15:47:32 +0200
Subject: [Buildroot] [git commit] python-pillow: fix typo on tiff package
	dependency
Message-ID: <20160706134804.A643D807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded16b82872547218dc5b83e9811c778adb0a029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/5ac12f08a366fc15ec138c900df0e5f62d0b70bc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pillow/python-pillow.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 878fdad..84d6e65 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -33,7 +33,7 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg2000
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
+ifeq ($(BR2_PACKAGE_TIFF),y)
 PYTHON_PILLOW_DEPENDENCIES += tiff
 PYTHON_PILLOW_BUILD_OPTS += --enable-tiff
 else
