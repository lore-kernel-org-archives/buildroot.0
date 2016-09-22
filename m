From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:59:26 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: change developer for
	gst1-rtsp-server
Message-ID: <20160922110030.1DD5F817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48f39ce01ac0b354f380d26b26af8f9edaa17bce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Piotr Nakraszewicz no longer works at Imgtec, and Abhilash Tuse
volunteered to take care of this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05446cc..25cc1ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,6 +26,9 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
+N:	Abhilash Tuse <abhilash.tuse@imgtec.com>
+F:	package/gstreamer1/gst1-rtsp-server/
+
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/nginx-naxsi/
 
@@ -1176,9 +1179,6 @@ N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 
-N:	Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
-F:	package/gstreamer1/gst1-rtsp-server/
-
 N:	Qais Yousef <Qais.Yousef@imgtec.com>
 F:	package/bellagio/
 
