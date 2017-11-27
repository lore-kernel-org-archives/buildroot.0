From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Nov 2017 00:27:56 +0100
Subject: [Buildroot] [git commit] Update for 2017.02.8
Message-ID: <20171127232059.CFD3C80819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4d77a4b6f8111c22dd72193b585a8a4b547877f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d745e94683d70d12a10a413a58e833df60042c50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index c0595f6..66d76d3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -597,6 +597,34 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.8, Released November 27th, 2017
+
+	Important / security related fixes.
+
+	Qt: 5.6 version updated to 5.6.3.
+
+	Reproducible: Do not override SOURCE_DATE_EPOCH if already set
+	in the environment.
+
+	Updated/fixed packages: apr, apr-util, arqp-standalone,
+	collectd, dvb-apps, ffmpeg, google-breakpad, gstreamer,
+	imagemagick, libfastjson, libglib2, libpjsip, libplist,
+	localedef, luajit, mesa3d, openssh, openssl, postgresql,
+	python3, python-pyqt5, qt5base, qt5canvas3d, qt5connectivity,
+	qt5declarative, qt5engineio, qt5graphicaleffects,
+	qt5imageformats, qt5location, qt5multimedia, qt5quickcontrols,
+	qt5quickcontrols2, qt5script, qt5sensors, qt5serialbus,
+	qt5serialport, qt5svg, qt5tools, qt5webchannel, qt5webkit,
+	qt5websockets, qt5x11extras, qt5xmlpatterns, quagga, ruby,
+	samba4, snmppp, ti-gfx, vboot-utils, webkitgtk, wireshark,
+	xapp_xdriinfo.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	10326: mesa3d package fails to build when BR2_SHARED_STATIC_LIBS=y
+	10361: python3 python-config script generates invalid includes
+	10501: host-localedef fails to compile on Ubuntu 17.10
+
 2017.02.7, Released October 28th, 2017
 
 	Important / security related fixes.
