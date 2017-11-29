From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 10:50:06 +0100
Subject: [Buildroot] [git commit] Update for 2017.08.2
Message-ID: <20171129094312.D329B7FBB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=951685e860776052a270a74d93ac80123ae0950f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1d02d0be586bfdaff926a7c6c8930d186cdd92b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/CHANGES b/CHANGES
index 66d76d3..cdd9481 100644
--- a/CHANGES
+++ b/CHANGES
@@ -68,6 +68,41 @@
 	#10426: uboot-tools' fw_setenv does not update the redundant...
 	#10451: libpcap 1.8.x and 1.7x does not compile on PPC
 
+2017.08.2, Released November 28th, 2017
+
+	Important / security related fixes.
+
+	Qt: 5.6 version updated to 5.6.3.
+
+	Reproducible: Do not override SOURCE_DATE_EPOCH if already set
+	in the environment.
+
+	Makefiles: Workaround include order issues for certain make
+	versions by explicitly sorting the result of wildcard where it
+	matters.
+
+	Updated/fixed packages: apr, apr-util, arqp-standalone,
+	azure-iot-sdk-c, collectd, dvb-apps, ffmpeg, go-bootstrap,
+	google-breakpad, gstreamer, imagemagick, irssi, jimtcl,
+	kvm-unit-test, libcurl, libfastjson, libglib2, libidn,
+	libpjsip, libplist, localedef, lttng-tools, luajit, mesa3d,
+	moarvm, mp4v2, openssh, openssl, oracle-mysql, postgresql,
+	python3, python-pyqt5, qt, qt5base, qt5canvas3d,
+	qt5connectivity, qt5declarative, qt5engineio,
+	qt5graphicaleffects, qt5imageformats, qt5location,
+	qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5script,
+	qt5sensors, qt5serialbus, qt5serialport, qt5svg, qt5tools,
+	qt5webchannel, qt5webkit, qt5websockets, qt5x11extras,
+	qt5xmlpatterns, quagga, redis, ruby, samba4, sdl2, snmppp,
+	swupdate, ti-gfx, uboot-tools, usb_modeswitch, vboot-utils,
+	webkitgtk, wget, wireshark, xapp_xdriinfo.
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	10326: mesa3d package fails to build when BR2_SHARED_STATIC_LIBS=y
+	10361: python3 python-config script generates invalid includes
+	10501: host-localedef fails to compile on Ubuntu 17.10
+
 2017.08.1, Released October 23rd, 2017
 
 	Important / security related fixes.
