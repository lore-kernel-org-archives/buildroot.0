From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 11:32:21 +0200
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20151010093229.CAE8A800D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=839672b2d14e7e7bf2e49bd44439ba1c0b5ef42a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8672ec4..e049ffc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,7 +1,7 @@
 menu "Target packages"
 
-	source "package/skeleton/Config.in"
 	source "package/busybox/Config.in"
+	source "package/skeleton/Config.in"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
@@ -171,8 +171,8 @@ menu "Filesystem and flash utilities"
 	source "package/nfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
 	source "package/simicsfs/Config.in"
-	source "package/squashfs/Config.in"
 	source "package/sp-oops-extract/Config.in"
+	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
 	source "package/unionfs/Config.in"
@@ -621,8 +621,8 @@ menu "External python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-lxml/Config.in"
-	source "package/python-mako/Config.in"
 	source "package/python-mad/Config.in"
+	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
@@ -733,8 +733,8 @@ endmenu
 
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
-	source "package/libzip/Config.in"
 	source "package/libsquish/Config.in"
+	source "package/libzip/Config.in"
 	source "package/lzo/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
@@ -984,8 +984,8 @@ menu "Networking"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
-	source "package/freeradius-client/Config.in"
 	source "package/fmlib/Config.in"
+	source "package/freeradius-client/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/gssdp/Config.in"
@@ -1010,7 +1010,6 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
-	source "package/libnice/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
@@ -1019,6 +1018,7 @@ menu "Networking"
 	source "package/libnetfilter_queue/Config.in"
 	source "package/libnfnetlink/Config.in"
 	source "package/libnftnl/Config.in"
+	source "package/libnice/Config.in"
 	source "package/libnl/Config.in"
 	source "package/liboauth/Config.in"
 	source "package/liboping/Config.in"
@@ -1192,8 +1192,8 @@ menu "Miscellaneous"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
-	source "package/qpdf/Config.in"
 	source "package/qemu/Config.in"
+	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
 	source "package/wine/Config.in"
