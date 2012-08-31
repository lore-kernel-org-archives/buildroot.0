From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Aug 2012 10:45:06 +0200
Subject: [Buildroot] [git commit] Update CHANGES with resolved bugs in the
	2012.08 cycle
Message-ID: <20120831085103.2988699413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b38ade5c2fd4bb8fc3583de7e6221b9dc89c013
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7049c38..024ee75 100644
--- a/CHANGES
+++ b/CHANGES
@@ -106,6 +106,16 @@
 	sound-theme-freedesktop, sysprof, webrtc-audio-processing,
 	xinetd, zxing
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1315: Allow use of older external toolchains without sysroot
+               support [won't fix]
+	#5276: Hiawatha needs to manage IPV6 if so [fixed]
+	#5360: buildroot fails when building "host-libglib2 2.30.2
+               Building" [won't fix, upstream problem]
+	#5384: Can't build packages relying on gets on newer glibc
+               [fixed]
+
 2012.05, Released May 30th, 2012:
 
 	Updated/fixed packages: busybox, netsnmp, pptp-linux
