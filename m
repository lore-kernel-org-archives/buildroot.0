From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 18:36:55 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] CHANGES: update with
 recent changes
Message-ID: <20210130171709.69A1981133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f48359ff877aae6ebb816eebd6e7e4573a8bbb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/CHANGES b/CHANGES
index a33ad56a71..731d3f61c7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2020.11.2, not yet released
+
+	Important / security related fixes.
+
+	Download: Ensure git submodules are correctly fetched if
+	enabled for a package with <pkg>_GIT_SUBMODULES = YES and the
+	host variant is downloaded first.
+
+	Toolchain: Mark CodeSourcery Aarch64 2014.11 toolchain as not
+	having libatomic. Bootlin PowerPC-440 FP toolchain updated for
+	SecurePLT fix.
+
+	pkg-stats: Fix python 3.8+ deprecation warning.
+
+	meson: Ensure ccache is not detected and used, as it may
+	conflict with the ccache handling in Buildroot.
+
+	Updated/fixed packages: barebox, boost, brltty, dbus,
+	docker-containerd, dovecot, dovecot-pigeonhole,
+	environment-setup, firmware-imx, gcc, gerbera, glibc,
+	gmrender-resurrect, igd2-for-linux, kodi-pvr-zattoo, libclc,
+	libfuse3, libllcp, libodb-mysql, libtorrent-rasterbar,
+	libupnp, lpc32xxcdl, luarocks, mpd, multipath-tools, mutt,
+	nfs-utils, nodejs, openjpeg, openldap, opentracing-cpp,
+	openvpn, p11-kit, paho-mqtt-c, php, poppler, postgresql,
+	python3, redis, resiprocate, rpm, runc, socat, sslh, sudo,
+	sunxi-mali-mainline-driver, syslog-ng, systemd, tini,
+	tpm2-tss, trace-cmd, tzdata, uboot-tools, uhd, ushare,
+	util-linux, vlc, wavpack, wireguard-linux-compat, wolfssl,
+	xapp_xload, xorriso, zic
+
+	Removed packages: libupnp18
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13471: package/mpd/mpd.conf make use of path not created
+
 2020.11.1, released December 27th, 2020
 
 	Important / security related fixes.
