From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 13:23:38 +0100
Subject: [Buildroot] [git commit] Update for 2014.11-rc3
Message-ID: <20141128122426.778FA7FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f30e54eb92b0fecd539b1719784c80c20c6dab23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES            |   23 +++++++++++++++++++++++
 Makefile           |    2 +-
 docs/download.html |   10 +++++-----
 docs/news.html     |   12 ++++++++++++
 4 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 85c1439..5c8ce1b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2014.11-rc3, Released November 28th, 2014
+
+	Fixes all over the tree.
+
+	System: File permissions of /etc/random-seed made more
+	restrictive.
+
+	Toolchain: Various fixes related to locale handling, a fix for
+	building the toolchain wrapper on MIPS.
+
+	Updated/fixed packages: bind, binutils. botan, btrfsprogs,
+	clamav, czmq, dhcp, dillo, dovecot, erlang, flac, gd, glibc,
+	gptfdisk, gst1-validate, heirloom-mailx, lame, libksba,
+	libllcp, libnspr, libpng, libshairplay, libtirpc, linux,
+	linux-headers, mpdecimal, mpg123, network-manager, nfstables,
+	nfs-utils, openssl, pcituils, qt, radvd, rtai, sqlcipher,
+	sstrip, tcpdump, uclibc, uemacs, ushare, wayland, weston,
+	xl2tp, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7670: Fails to build mpc-1.0.2 on latest Cygwin
+
 2014.11-rc2, Released November 21st, 2014
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index b66bea0..e219d33 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2014.11-rc2
+export BR2_VERSION := 2014.11-rc3
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
diff --git a/docs/download.html b/docs/download.html
index 4614749..7c06bc7 100644
--- a/docs/download.html
+++ b/docs/download.html
@@ -18,14 +18,14 @@ or
 
 <p>
 
-The latest release candidate is <b>2014.11-rc2</b>, which can be
+The latest release candidate is <b>2014.11-rc3</b>, which can be
 downloaded here:<p>
 
-<a href="/downloads/buildroot-2014.11-rc2.tar.gz">buildroot-2014.11-rc2.tar.gz</a>
-(<a href="/downloads/buildroot-2014.11-rc2.tar.gz.sign">PGP signature</a>)
+<a href="/downloads/buildroot-2014.11-rc3.tar.gz">buildroot-2014.11-rc3.tar.gz</a>
+(<a href="/downloads/buildroot-2014.11-rc3.tar.gz.sign">PGP signature</a>)
 or
-<a href="/downloads/buildroot-2014.11-rc2.tar.bz2">buildroot-2014.11-rc2.tar.bz2</a>
-(<a href="/downloads/buildroot-2014.11-rc2.tar.bz2.sign">PGP signature</a>).
+<a href="/downloads/buildroot-2014.11-rc3.tar.bz2">buildroot-2014.11-rc3.tar.bz2</a>
+(<a href="/downloads/buildroot-2014.11-rc3.tar.bz2.sign">PGP signature</a>).
 <p>
 
 This and earlier releases (and their PGP signatures) can always be downloaded from
diff --git a/docs/news.html b/docs/news.html
index 9a8aab5..3d0e1d6 100644
--- a/docs/news.html
+++ b/docs/news.html
@@ -9,6 +9,18 @@
 
 <ul>
 
+  <li><b>28 November 2014 -- 2014.11-rc3 released</b>
+
+    <p>Release candidate 3 is out with more cleanups and build fixes. See the <a
+    href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2014.11-rc3">CHANGES</a>
+    file for details.</p>
+
+    <p>Head to the <a href="/downloads/">downloads page</a> to pick up the
+    <a href="/downloads/buildroot-2014.11-rc3.tar.bz2">2014.11-rc3
+    release candidate</a>, and report any problems found to the <a
+    href="lists.html">mailing list</a> or <a
+    href="https://bugs.uclibc.org">bug tracker</a>.</p>
+
   <li><b>21 November 2014 -- 2014.11-rc2 released</b>
 
     <p>Another week, another release candidate with more cleanups and
