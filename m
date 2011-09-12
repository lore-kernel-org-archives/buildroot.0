From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Sep 2011 00:46:06 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110912224631.057208D58F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=227eebae0053363aa30353472cea5f7160cd3938
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 288d575..5a44e72 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,25 @@
 2011.11, Not released yet:
 
+	Fixes all over the tree and new features.
+
+	Update external codesourcery toolchain download URLs after
+	Codesourcery got bought by Mentor.
+
+	Updated/fixed packages: busybox, dbus, dbus-glib, directfb,
+	dnsmasq, e2fsprogs, ethtool, fakeroot, fbdump, freetype, fuse,
+	gamin, jpeg, leafpad, libargtable2, libao, libconfuse,
+	libcuefile, libcurl, libreplaygain, libsamplerate, libsndfile,
+	libsoup, libsvgtiny, lighttpd, lzo, lzop, mpd, mpg123,
+	musepack, mysql_client, netcat, netsnmp, ntfs-3g, ntfsprogs,
+	openssl, radvd, samba, sdl_sound, sqlite, squid, sylpheed,
+	taglib, tar, tcpreplay, util-linux, xterm
+
+	New packages: fluxbox, libev, libftdi, libgeotiff, portaudio
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4183: Codesourcery toolchain download site has changed
+
 2011.08, Released August 31th, 2011:
 
 	Fixes all over the tree.
-- 
1.7.3.4
