From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:05:46 +0100
Subject: [Buildroot] [git commit] package/mesa3d-demos: remove
	copy-and-paste artifact from 0001-demos-optional-gl.patch
Message-ID: <20151215221257.20D037F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36a974dbc4d0d42a9aea0788ed3e59f09357e74f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-demos/0001-demos-optional-gl.patch | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mesa3d-demos/0001-demos-optional-gl.patch b/package/mesa3d-demos/0001-demos-optional-gl.patch
index 0415bbc..6470e9d 100644
--- a/package/mesa3d-demos/0001-demos-optional-gl.patch
+++ b/package/mesa3d-demos/0001-demos-optional-gl.patch
@@ -72,6 +72,3 @@ Index: mesa3d-demos-8.1.0/src/util/Makefile.am
  
  if HAVE_GLUT
  AM_CFLAGS += \
-diff -uNr mesa-demos-8.3.0.org/configure.ac mesa-demos-8.3.0/configure.ac
---- mesa-demos-8.3.0.org/configure.ac	2015-12-09 22:06:44.000000000 +0100
-+++ mesa-demos-8.3.0/configure.ac	2015-12-12 17:06:10.484295811 +0100
