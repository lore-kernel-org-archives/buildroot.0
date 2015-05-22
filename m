From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 11:53:58 +0200
Subject: [Buildroot] [git commit] Update for 2015.05-rc3
Message-ID: <20150522103908.BA88980540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6ce119cb060941da65d254c1344aa123baf541c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                    |   27 +++++++++++++++++++++++++++
 Makefile                   |    2 +-
 docs/website/download.html |   10 +++++-----
 docs/website/news.html     |   12 ++++++++++++
 4 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 11895e6..e554d57 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,30 @@
+2015.05-rc3, Released May 22nd, 2015
+
+	Several fixes, mainly related to static linking.
+
+	Updated/fixed packages: acl, alsa-utils, apr, armadillo, attr,
+	autoconf-archive, binutils, boost, czmq, dhcpcd, duma,
+	enlightenment, exim, fbterm, freerdp, gcc, gdk-pixbuf,
+	google-breakpad, gpsd, heirloom-mailx, hwloc, ipmiutil,
+	iproute2, jack2, jasper, kmod, lcdproc, leafnode2, libcap-ng,
+	libftdi1, libmatroska, libmemcached, libmodbus, libnftnl,
+	libsigrok, libupnpp, libuv, libxml-parser-perl, linux,
+	linux-headers, lirc-tools, lua-periphery, lxc, mongoose, mono,
+	mpg123, mosquitto, neardal, newt, ntp, ola, openldap, opencv,
+	php, postgresql, protobuf, pulseaudio, python-pyqt, qemu, qt,
+	qt5base, rpi-userland, rsyslog, snmppp, sqlite, tiff,
+	tinyxml2, uboot-tools, unionfs, ux5000-firmware, usbredir,
+	ushare, vpnc, vsftpd, wavpack, wireless_tools, wsapi,
+	wvstreams, xmlstarlet, zeromq, zmqpp
+
+	New packages: c-periphery
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8106: mkfs.jffs2 uses the --pagesize parameter incorrectly
+	#8111: 2015.05.rc2 LIBFOO_CONF_OPTS not working
+	#8126: exim lacks plaintext and cram-md5 auth
+
 2015.05-rc2, Released May 11th, 2015
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 5c4293b..cf244d7 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.05-rc2
+export BR2_VERSION := 2015.05-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/website/download.html b/docs/website/download.html
index 9362ccf..640800e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2015.05-rc2</b>, which can be
+The latest release candidate is <b>2015.05-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2015.05-rc2.tar.gz">buildroot-2015.05-rc2.tar.gz</a>
-(<a href="/downloads/buildroot-2015.05-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2015.05-rc3.tar.gz">buildroot-2015.05-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2015.05-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2015.05-rc2.tar.bz2">buildroot-2015.05-rc2.tar.bz2</a>
-(<a href="/downloads/buildroot-2015.05-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2015.05-rc3.tar.bz2">buildroot-2015.05-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2015.05-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/website/news.html b/docs/website/news.html
index 6ca5647..39fe693 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -8,6 +8,18 @@
 <p>
 
 <ul>
+ <li><b>22 May 2015 -- 2015.05-rc3 released</b>
+
+    <p>Release candidate 3 is out with more cleanups and security / build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.05-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2015.02-rc5.tar.bz2">2015.05-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>11 May 2015 -- 2015.05-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
