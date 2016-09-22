From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:57:47 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add entries for recently
	added/modified code
Message-ID: <20160922105823.1BA1981EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64cfd4d95fd8872354833ace03913c97612cee54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the DEVELOPERS files with packages or defconfigs
recently added, plus additional entries for developers who have modified
packages they are usually taking care of.

Cc: Christian Stewart <christian@paral.in>
Cc: Cyril Bur <cyrilbur@gmail.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Manuel V??gele <develop@manuel-voegele.de>
Cc: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
Cc: Romain Perier <romain.perier@free-electrons.com>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 84e00c8..05446cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -282,6 +282,9 @@ F:	package/micropython-lib/
 F:	package/syslog-ng/
 
 N:	Christian Stewart <christian@paral.in>
+F:	linux/linux-ext-aufs.mk
+F:	package/aufs/
+F:	package/aufs-util/
 F:	package/batman-adv/
 F:	package/docker-containerd/
 F:	package/docker-engine/
@@ -316,6 +319,9 @@ F:	package/ustr/
 N:	C??dric Ch??pied <cedric.chepied@gmail.com>
 F:	package/znc/
 
+N:	Cyril Bur <cyrilbur@gmail.com>
+F:	package/kvm-unit-tests
+
 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/libamcodec/
 F:	package/odroid-mali/
@@ -339,6 +345,7 @@ F:	package/libftdi1/
 N:	Danomi Manchego <danomimanchego123@gmail.com>
 F:	package/cjson/
 F:	package/jq/
+F:	package/libwebsockets/
 F:	package/ljsyscall/
 F:	package/lua-cjson/
 F:	package/luaexpat/
@@ -393,6 +400,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/smack/
+F:	package/xvisor/
 
 N:	Eric Limpens <limpens@gmail.com>
 F:	package/pifmrds/
@@ -425,7 +433,9 @@ F:	package/openbox/
 F:	package/supertuxkart/
 
 N:	Fabio Estevam <festevam@gmail.com>
+F:	board/warp7/
 F:	configs/freescale_imx*
+F:	configs/warp7_defconfig
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
 F:	package/netsurf-buildsystem/
@@ -440,6 +450,8 @@ F:	package/alljoyn-base/
 F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/gtksourceview/
+F:	package/gssdp/
+F:	package/gupnp/
 F:	package/gupnp-dlna/
 F:	package/gupnp-tools/
 F:	package/igd2-for-linux/
@@ -577,6 +589,7 @@ F:	package/gpsd/
 F:	package/granite/
 F:	package/graphite2/
 F:	package/gsettings-desktop-schemas/
+F:	package/gstreamer1/
 F:	package/hans/
 F:	package/haveged/
 F:	package/heimdal/
@@ -647,6 +660,7 @@ F:	package/obsidian-cursors/
 F:	package/ocf-linux/
 F:	package/opencore-amr/
 F:	package/openswan/
+F:	package/openvpn/
 F:	package/opusfile/
 F:	package/p11-kit/
 F:	package/p910nd/
@@ -843,6 +857,7 @@ F:	package/libupnpp/
 F:	package/luv/
 F:	package/luvi/
 F:	package/mp4v2/
+F:	package/mpd/
 F:	package/shairport-sync/
 F:	package/swupdate/
 F:	package/upmpdcli/
@@ -879,6 +894,7 @@ F:	package/exim/
 F:	package/libpjsip/
 F:	package/qpid-proton/
 F:	package/rtl8188eu/
+F:	package/snmppp/
 F:	package/stm32flash/
 F:	package/unzip/
 F:	support/legal-info/
@@ -901,6 +917,7 @@ N:	Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
 F:	package/nvme/
 
 N:	Manuel V??gele <develop@manuel-voegele.de>
+F:	package/python-pyqt5/
 F:	package/python-requests-toolbelt/
 
 N:	Marcin Bis <marcin@bis.org.pl>
@@ -929,6 +946,11 @@ F:	package/ca-certificates/
 N:	Martin Hicks <mort@bork.org>
 F:	package/cryptsetup/
 
+N:	Mathieu Audat <mathieu.audat@savoirfairelinux.com>
+F:	board/technologic/ts4900/
+F:	configs/ts4900_defconfig
+F:	package/ts4900-fpga/
+
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	package/bc/
 F:	package/eigen/
@@ -1089,9 +1111,12 @@ N:	Pedro Aguilar <paguilar@paguilar.org>
 F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
+F:	board/orangepi/
+F:	configs/orangepipc_defconfig
 F:	package/flickcurl/
 F:	package/libfastjson/
 F:	package/lzop/
+F:	package/mosquitto/
 F:	package/python-alsaaudio/
 F:	package/python-enum/
 F:	package/python-enum34/
@@ -1102,6 +1127,8 @@ F:	package/triggerhappy/
 F:	package/wpa_supplicant/
 
 N:	Peter Seiderer <ps.report@gmx.net>
+F:	board/raspberrypi/
+F:	configs/raspberrypi3_defconfig
 F:	package/assimp/
 F:	package/bcm2835/
 F:	package/dejavu/
@@ -1109,6 +1136,7 @@ F:	package/dillo/
 F:	package/edid-decode/
 F:	package/ghostscript-fonts/
 F:	package/gstreamer1/gst1-validate/
+F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/qt5/qt53d/
@@ -1148,6 +1176,9 @@ N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 
+N:	Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
+F:	package/gstreamer1/gst1-rtsp-server/
+
 N:	Qais Yousef <Qais.Yousef@imgtec.com>
 F:	package/bellagio/
 
@@ -1193,6 +1224,9 @@ F:	package/stress-ng/
 F:	package/terminology/
 F:	package/xenomai/
 
+N:	Romain Perier <romain.perier@free-electrons.com>
+F:	package/amd-catalyst/
+
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
@@ -1353,6 +1387,9 @@ F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
 
+N:	Theo Debrouwere <t.debrouwere@televic.com>
+F:	package/pugixml/
+
 N:	Thierry Bultel <tbultel@free.fr>
 F:	package/mpd-mpc/
 
@@ -1523,6 +1560,7 @@ F:	package/libseccomp/
 F:	package/mesa3d-headers/
 F:	package/mke2img/
 F:	package/nut/
+F:	package/nvidia-driver/
 F:	package/omxplayer/
 F:	package/python-pyparsing/
 F:	package/pkg-download.mk
