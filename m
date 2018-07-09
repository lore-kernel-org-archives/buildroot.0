From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jul 2018 23:50:54 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: fix alphabetic order of entries
Message-ID: <20180709214918.7B6917FADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfa2949b9f6bf82060ae2d34e05eb253ff7ae76e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 144 ++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index cba1344d1d..82accbbc3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,15 +158,15 @@ F:	package/sysdig/
 N:	Anisse Astier <anisse@astier.eu>
 F:	package/go/
 
-N:	Antony Pavlov <antonynpavlov@gmail.com>
-F:	package/lsscsi/
-
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
 
 N:	Antoine T??nart <antoine.tenart@bootlin.com>
 F:	package/wf111/
 
+N:	Antony Pavlov <antonynpavlov@gmail.com>
+F:	package/lsscsi/
+
 N:	ARC Maintainers <arc-buildroot@synopsys.com>
 F:	arch/Config.in.arc
 F:	board/synopsys/
@@ -436,6 +436,9 @@ F:	package/libdvbsi/
 F:	package/libsvg/
 F:	package/libsvg-cairo/
 
+N:	C??dric Ch??pied <cedric.chepied@gmail.com>
+F:	package/znc/
+
 N:	Chakra Divi <chakra@openedev.com>
 F:	board/friendlyarm/nanopi-m1
 F:	board/friendlyarm/nanopi-m1-plus
@@ -492,9 +495,6 @@ F:	package/ustr/
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
 F:	package/libloki/
 
-N:	C??dric Ch??pied <cedric.chepied@gmail.com>
-F:	package/znc/
-
 N:	Cyril Bur <cyrilbur@gmail.com>
 F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests
@@ -937,14 +937,14 @@ F:	package/yad/
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
-N:	Jan Kundr??t <jan.kundrat@cesnet.cz>
-F:	configs/solidrun_clearfog_defconfig
-F:	board/solidrun/clearfog/
-
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
 
+N:	Jan Kundr??t <jan.kundrat@cesnet.cz>
+F:	configs/solidrun_clearfog_defconfig
+F:	board/solidrun/clearfog/
+
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
 
@@ -968,6 +968,20 @@ F:	package/batctl/
 N:	Jeremy Rosen <jeremy.rosen@openwide.fr>
 F:	package/fxload/
 
+N:	J??r??me Oufella <jerome.oufella@savoirfairelinux.com>
+F:	package/libdri2/
+F:	package/qt-webkit-kiosk/
+
+N:	J??r??me Pouiller <jezz@sysmic.org>
+F:	package/apitrace/
+F:	package/freescale-imx/gpu-amd-bin-mx51/
+F:	package/freescale-imx/libz160/
+F:	package/lxc/
+F:	package/strongswan/
+F:	package/wmctrl/
+F:	package/x11r7/xdriver_xf86-video-imx/
+F:	package/x11r7/xdriver_xf86-video-imx-viv/
+
 N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/cmocka/
 F:	package/flatcc/
@@ -977,17 +991,6 @@ F:	package/pdbg/
 F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
-N:	Joseph Kogut <joseph.kogut@gmail.com>
-F:	package/at-spi2-atk/
-F:	package/at-spi2-core/
-F:	package/gconf/
-F:	package/libnss/
-F:	package/python-cython/
-F:	package/python-raven/
-F:	package/python-schedule/
-F:	package/python-websockets/
-F:	package/python-xlib/
-
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
 
@@ -1026,6 +1029,24 @@ N:	Jonathan Liu <net147@gmail.com>
 F:	package/python-meld3/
 F:	package/supervisor/
 
+N:	J??rg Krause <joerg.krause@embedded.rocks>
+F:	board/lemaker/bananapro/
+F:	configs/bananapro_defconfig
+F:	package/augeas/
+F:	package/bctoolbox/
+F:	package/freescale-imx/imx-alsa-plugins/
+F:	package/libopusenc/
+F:	package/libshout/
+F:	package/libupnpp/
+F:	package/luv/
+F:	package/luvi/
+F:	package/mp4v2/
+F:	package/mpd/
+F:	package/shairport-sync/
+F:	package/swupdate/
+F:	package/upmpdcli/
+F:	package/wavemon/
+
 N:	Joris Lijssens <joris.lijssens@gmail.com>
 F:	package/emlog/
 F:	package/libcoap/
@@ -1034,6 +1055,17 @@ F:	package/libuio/
 F:	package/netsniff-ng/
 F:	package/rabbitmq-c/
 
+N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/at-spi2-atk/
+F:	package/at-spi2-core/
+F:	package/gconf/
+F:	package/libnss/
+F:	package/python-cython/
+F:	package/python-raven/
+F:	package/python-schedule/
+F:	package/python-websockets/
+F:	package/python-xlib/
+
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
@@ -1065,9 +1097,6 @@ F:	package/qt5/
 N:	Julien Floret <julien.floret@6wind.com>
 F:	package/lldpd/
 
-N:	Laurent Charpentier <laurent_pubs@yahoo.com>
-F:	package/open-lldp/
-
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
 F:	package/easy-rsa/
@@ -1075,38 +1104,6 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
-N:	J??r??me Oufella <jerome.oufella@savoirfairelinux.com>
-F:	package/libdri2/
-F:	package/qt-webkit-kiosk/
-
-N:	J??r??me Pouiller <jezz@sysmic.org>
-F:	package/apitrace/
-F:	package/freescale-imx/gpu-amd-bin-mx51/
-F:	package/freescale-imx/libz160/
-F:	package/lxc/
-F:	package/strongswan/
-F:	package/wmctrl/
-F:	package/x11r7/xdriver_xf86-video-imx/
-F:	package/x11r7/xdriver_xf86-video-imx-viv/
-
-N:	J??rg Krause <joerg.krause@embedded.rocks>
-F:	board/lemaker/bananapro/
-F:	configs/bananapro_defconfig
-F:	package/augeas/
-F:	package/bctoolbox/
-F:	package/freescale-imx/imx-alsa-plugins/
-F:	package/libopusenc/
-F:	package/libshout/
-F:	package/libupnpp/
-F:	package/luv/
-F:	package/luvi/
-F:	package/mp4v2/
-F:	package/mpd/
-F:	package/shairport-sync/
-F:	package/swupdate/
-F:	package/upmpdcli/
-F:	package/wavemon/
-
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
 F:	package/openvmtools/
@@ -1130,6 +1127,9 @@ F:	package/nilfs-utils/
 N:	Laurent Cans <laurent.cans@gmail.com>
 F:	package/aircrack-ng/
 
+N:	Laurent Charpentier <laurent_pubs@yahoo.com>
+F:	package/open-lldp/
+
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
@@ -1414,6 +1414,10 @@ N:	Micha?? ??yszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
 F:	configs/socrates_cyclone5_defconfig
 
+N:	Mike Harmony <mike.harmony@snapav.com>
+F:	board/sinovoip/m2-plus/
+F:	configs/bananapi_m2_plus_defconfig
+
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
@@ -1427,10 +1431,6 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
-N:	Mike Harmony <mike.harmony@snapav.com>
-F:	board/sinovoip/m2-plus/
-F:	configs/bananapi_m2_plus_defconfig
-
 N:	Myl??ne Josserand <mylene.josserand@bootlin.com>
 F:	package/rtl8723bu/
 
@@ -1643,6 +1643,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:	R??mi R??rolle <remi.rerolle@gmail.com>
+F:	package/libfreeimage/
+
 N:	Renaud Aubin <root@renaud.io>
 F:	package/libhttpparser/
 
@@ -1673,9 +1676,6 @@ F:	package/chocolate-doom/
 F:	package/irssi/
 F:	package/vnstat/
 
-N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
-F:	package/davfs2/
-
 N:	Romain Naour <romain.naour@gmail.com>
 F:	package/aubio/
 F:	package/bullet/
@@ -1706,6 +1706,9 @@ F:	package/tk/
 F:	package/upower/
 F:	package/xenomai/
 
+N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
+F:	package/davfs2/
+
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
@@ -1724,9 +1727,6 @@ F:	package/mariadb/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
-N:	R??mi R??rolle <remi.rerolle@gmail.com>
-F:	package/libfreeimage/
-
 N:	Sam Bobroff <sam.bobroff@au1.ibm.com>
 F:	arch/Config.in.powerpc
 F:	package/librtas/
@@ -1762,6 +1762,12 @@ F:	package/kyua/
 F:	package/lutok/
 F:	package/yaml-cpp/
 
+N:	S??bastien Szymanski <sebastien.szymanski@armadeus.com>
+F:	package/mmc-utils/
+F:	package/python-flask-jsonrpc/
+F:	package/python-flask-login/
+F:	package/qt5/qt5charts/
+
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
@@ -1892,12 +1898,6 @@ F:	package/libmms/
 F:	package/orc/
 F:	package/wampcc/
 
-N:	S??bastien Szymanski <sebastien.szymanski@armadeus.com>
-F:	package/mmc-utils/
-F:	package/python-flask-jsonrpc/
-F:	package/python-flask-login/
-F:	package/qt5/qt5charts/
-
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	package/pugixml/
 
