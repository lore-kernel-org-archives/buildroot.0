From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 10:37:21 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] Update for 2019.02.2
Message-ID: <20190429083233.394768132C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b4b3e7cd4618e56f5c6a8ea098ffd573a2e868e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++------------
 Makefile |  4 ++--
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 622b31141a..e5021f7f90 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2019.02.2, Not yet released
+2019.02.2, Released April 29th, 2019
 
 	Important / security related fixes.
 
@@ -24,17 +24,18 @@
 	busybox, civetweb, cjson, copas, davfs2, docker-cli,
 	docker-containerd, docker-engine, dovecot, dovecot-pigeonhole,
 	freerdp, gerbera, ghostscript, git, gnutls, go, gst-omx,
-	gst1-plugins-ugly, haproxy, hostapd, ipsec-tools, libfreefare,
-	libfuse, libkrb5, libpng, libxml2, libxslt, linknx, linux,
-	linux-firmware, linux-tools, live555, lldp, lrzsz, lynx,
-	madplay, make, minicom, mongodb, msmtp, musl, mutt, neon,
-	netsnmp, numactl, opus, perl, php, postgresql, pure-ftpd,
-	python-urllib3, python3, qt5base, rapidxml, rpm, rsyslog,
-	ruby, runc, samba4, sane-backends, softether, stunnel,
-	sysklogd, syslinux, syslog-ng, systemd-bootchart, thttpd,
-	thrift, tiff, tor, tpm2-tools, tpm2-tss, webkitgtk,
-	yaffs2utils, wget, wpa_supplicant, wsapi, xapp_xfd,
-	xlib_libXpm, xserver_xorg-server, xz, znc
+	gst1-plugins-base, gst1-plugins-ugly, haproxy, hostapd,
+	ipsec-tools, libfreefare, libfuse, libkrb5, libpng, libxml2,
+	libxslt, linknx, linux, linux-firmware, linux-tools, live555,
+	lldp, lrzsz, lynx, madplay, make, minicom, mongodb, msmtp,
+	musl, mutt, neon, netsnmp, numactl, opus, perl, php,
+	postgresql, pure-ftpd, python-urllib3, python3, qt5base,
+	rapidxml, rpm, rsyslog, ruby, runc, samba4, sane-backends,
+	softether, stunnel, sysklogd, syslinux, syslog-ng,
+	systemd-bootchart, thttpd, thrift, tiff, tor, tpm2-tools,
+	tpm2-tss, webkitgtk, yaffs2utils, wget, wpa_supplicant, wsapi,
+	xapp_xfd, xapp_xload, xlib_libXpm, xserver_xorg-server, xz,
+	znc
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Makefile b/Makefile
index 5438c3e733..c510b7cbaa 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02.1
+export BR2_VERSION := 2019.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1553900000
+BR2_VERSION_EPOCH = 1556527000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
