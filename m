From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 23:34:17 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20190819213116.C142C82295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8bdbef245cae026cb6cfd6e1cb35da756784c14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4a6e42e8fd..4f95012c44 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,46 @@
+2019.08-rc2, not yet released
+
+	Fixes all over the tree.
+
+	Compile fixes for a number of defconfigs.
+
+	Updated/fixed packages: apache, autofs, batctl, batman-adv,
+	bind, collectd, cwiid, dahdi-linux, dahdi-tools, daq,
+	dehydrated, dhcp, dtc, efl, enlightenment, evtest, gnutls, go,
+	gst-plugins-bad, gst-plugins-base, gst1-plugins-bad,
+	gst1-plugins-base, gst1-rtsp-server, gtkmm3, gupnp, harfbuzz,
+	imagemagick, lftp, libbsd, libcpprestsdk, libdnet, libfm,
+	libgit2, libgtk2, libgtk3, libpri, librsvg, libss7, libssh2,
+	libwpe, lua-cqueues, metacity, micropython, mpd, mpg123, musl,
+	mpv, openblas, openbox, opencv, pango, pcmanfm, piglit,
+	pigpio, pinentry, postgresql, qemu, qt5base, qt5enginio,
+	qt5multimedia, qt5serialbus, quazip, rrdtool, rygel, samba4,
+	stellarium, tcpreplay, ti-gfx, vte, wampcc,
+	wilink-bt-firmware, wireless-regdb, wpebackend-fdo,
+	xscreensaver
+
+	Removed packages: libamcodec, odroid-mali, odroid-scripts
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#9481:  NetworkManager/Ping unable to resolve domains
+	#10566: php.mk is missing option --with-pgsql
+	#10861: Package batman_adv Makefile is missing include header direct..
+	#11641: linux kernel .config timestamp always out of date fixed with..
+	#11671: russian locale ru_RU:145: LC_TIME: syntax error
+	#11701: recuuring of usr and in bin shortcuts are created
+	#11741: pigpio does not build host-pigpio
+	#11876: automount using host mount/umount
+	#11881: Build breaks with lftp package enabled and libexpat1-dev inst..
+	#11921: dahdi fails to build
+	#11936: libcpprestsdk should install to staging
+	#11946: wilink-bt-firmware: moved from github to http://git.ti.com/ti-bt
+	#11961: libpri build failure
+	#12086: dhcp shared libraries not installed to target
+	#12096: tcpreplay: build fails if libdumbnet-dev is installed in the..
+	#12106: daq: build fails if libdumbnet-dev is installed in the host
+	#12126: vc4 has neon as hard dependency
+
 2019.08-rc1, released August 9th, 2019
 
 	Fixes all over the tree and new features.
