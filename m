From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 22:48:51 +0100
Subject: [Buildroot] [git commit] Update for 2020.02.10
Message-ID: <20210131213104.74E4F7FBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0518eee5753779f021b2c6497d2d6f53c5951d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5d3fc5a53ec4dabfa25e6b7478e8dc9cb0c9588)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/CHANGES b/CHANGES
index ba88b3f57f..733951d6eb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -775,6 +775,43 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.10, released January 31st, 2021
+
+	Important / security related fixes.
+
+	Download: Ensure git submodules are correctly fetched if
+	enabled for a package with <pkg>_GIT_SUBMODULES = YES and the
+	host variant is downloaded first.
+
+	Toolchain: Mark CodeSourcery Aarch64 2014.11 toolchain as not
+	having libatomic.
+
+	pkg-stats: Fix python 3.8+ deprecation warning.
+
+	meson: Ensure ccache is not detected and used, as it may
+	conflict with the ccache handling in Buildroot.
+
+	New packages: libnpupnp
+
+	Updated/fixed packages: bctoolbox, brltty, dbus, dovecot,
+	dovecot-pigeonhole, gcc, gerbera, gmrender-resurrect, gst-omx,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-rtsp-server, gst1-vaapi,
+	gst1-validate, gstreamer1, gstreamer1-editing-services,
+	igd2-for-linux, libclc, libllcp, libtorrent-rasterbar,
+	libupnp, libupnpp, lpc32xxcdl, luarocks, mpd, nfs-utils,
+	nodejs, openjpeg, openldap, opentracing-cpp, openvpn, p11-kit,
+	paho-mqtt-c, php, poppler, postgresql, python3, runc, sudo,
+	syslog-ng, systemd, tini, trace-cmd, tzdata, ushare, vlc,
+	wavpack, wireguard-linux-compat, wolfssl, xapp_xload, xorriso,
+	zic
+
+	Removed packages: libupnp18
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13471: package/mpd/mpd.conf make use of path not created
+
 2020.02.9, released December 27th, 2020
 
 	Important / security related fixes.
