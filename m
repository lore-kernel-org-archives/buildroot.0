From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Nov 2017 23:43:42 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20171105223712.1AEEF81090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10b9c36078ba7467f9a040c6b74a9402b9fd5a2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new/removed packages, closed bugzilla issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index e54c48a..7050af3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,7 @@
 2017.11-rc1, To be released
 
+	Fixes all over the tree and new features.
+
 	libssh2: there is now an explicit choice of the backend to use
 	(mbedtls, gnutls or openssl). Previously, the choice was implicit
 	based on the TLS library that was selected. Now, it is possible to
@@ -11,6 +13,32 @@
 	bit bigger than before. To remove unneeded MIBS, you should use a
 	post-build script.
 
+	New packages: asterisk, azmq, bcg729, boinc, dahdi-linux,
+	dahdi-tools, freeswitch-mod-bcg729, fscryptctl, libb64,
+	libpri, libss7, lua-basexx, lua-compat53, lua-cqueues,
+	lua-curl, lua-datafile, lua-fifo, lua-httpd,
+	lua-lpeg-patterns, lua-markdown, lua-sailor, lua-value,
+	luksmeta, minetest, minetest-game, pdmenu, prosody,
+	python-aiocoap, python-automat, python-ibmiotf,
+	python-iso8601, python-m2r, python-simplesqlite,
+	python-websockets, python-xmltodict, qt5wayland, qt5webengine,
+	restorecond, selinux-python, semodule-utils, uhubctl,
+	wireguard, wsapi-fcgi, wsapi-xavante
+
+	Removed packages: aiccu, rfkill, sepolgen
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10281: lsblk does not compile for util-linux
+	#10336: lttng compilation fails : linking error
+	#10351: glibc missing in rootfs
+	#10356: nfs-utils missing header
+	#10366: dropbear download url has changed
+	#10391: WiringPi retrieves wrong (old) version
+	#10406: Beaglebone black: Buggy SGX driver version, swapped...
+	#10426: uboot-tools' fw_setenv does not update the redundant...
+	#10451: libpcap 1.8.x and 1.7x does not compile on PPC
+
 2017.08.1, Released October 23rd, 2017
 
 	Important / security related fixes.
