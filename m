From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Dec 2015 07:32:56 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d-demos: remove
	copy-and-paste artifact from 0001-demos-optional-gl.patch
In-Reply-To: <1450074776-18055-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450074776-18055-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450074776-18055-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: split patch from previous patch regarding glesv1 (Thomas)

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
-- 
2.6.2
