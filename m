From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:16:27 +0100
Subject: [Buildroot] [git commit] packages/Config.in: Alphabetical entries
	sorting
Message-ID: <20131027101944.7B1E29BBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5f72988532373139bcd441a85ecd72a0a0cd904
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch moves :
  "Filesystem and flash utilities" menu
  "X applications" category
  "JSON/XML" menu
so they are in alphabetical order with the rest of the file.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |  114 ++++++++++++++++++++++++++--------------------------
 1 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..e40fa31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -129,6 +129,32 @@ source "package/vala/Config.in"
 source "package/yasm/Config.in"
 endmenu
 
+menu "Filesystem and flash utilities"
+source "package/cifs-utils/Config.in"
+source "package/cramfs/Config.in"
+source "package/curlftpfs/Config.in"
+source "package/dosfstools/Config.in"
+source "package/e2fsprogs/Config.in"
+source "package/ecryptfs-utils/Config.in"
+source "package/exfat/Config.in"
+source "package/exfat-utils/Config.in"
+source "package/f2fs-tools/Config.in"
+source "package/flashbench/Config.in"
+source "package/genext2fs/Config.in"
+source "package/genromfs/Config.in"
+source "package/kobs-ng/Config.in"
+source "package/makedevs/Config.in"
+source "package/mtd/Config.in"
+source "package/nfs-utils/Config.in"
+source "package/ntfs-3g/Config.in"
+source "package/squashfs/Config.in"
+source "package/squashfs3/Config.in"
+source "package/sshfs/Config.in"
+source "package/sunxi-tools/Config.in"
+source "package/unionfs/Config.in"
+source "package/xfsprogs/Config.in"
+endmenu
+
 menu "Games"
 source "package/doom-wad/Config.in"
 source "package/gnuchess/Config.in"
@@ -187,18 +213,6 @@ source "package/qt5/Config.in"
 source "package/x11r7/Config.in"
 source "package/weston/Config.in"
 
-comment "X libraries and helper libraries"
-source "package/liberation/Config.in"
-source "package/libsexy/Config.in"
-source "package/x11r7/xkeyboard-config/Config.in"
-
-comment "X Window managers"
-source "package/blackbox/Config.in"
-source "package/enlightenment/Config.in"
-source "package/fluxbox/Config.in"
-source "package/matchbox/Config.in"
-source "package/metacity/Config.in"
-
 comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/docker/Config.in"
@@ -220,32 +234,18 @@ source "package/xscreensaver/Config.in"
 source "package/xstroke/Config.in"
 source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
-endmenu
 
-menu "Filesystem and flash utilities"
-source "package/cifs-utils/Config.in"
-source "package/cramfs/Config.in"
-source "package/curlftpfs/Config.in"
-source "package/dosfstools/Config.in"
-source "package/e2fsprogs/Config.in"
-source "package/ecryptfs-utils/Config.in"
-source "package/exfat/Config.in"
-source "package/exfat-utils/Config.in"
-source "package/f2fs-tools/Config.in"
-source "package/flashbench/Config.in"
-source "package/genext2fs/Config.in"
-source "package/genromfs/Config.in"
-source "package/kobs-ng/Config.in"
-source "package/makedevs/Config.in"
-source "package/mtd/Config.in"
-source "package/nfs-utils/Config.in"
-source "package/ntfs-3g/Config.in"
-source "package/squashfs/Config.in"
-source "package/squashfs3/Config.in"
-source "package/sshfs/Config.in"
-source "package/sunxi-tools/Config.in"
-source "package/unionfs/Config.in"
-source "package/xfsprogs/Config.in"
+comment "X libraries and helper libraries"
+source "package/liberation/Config.in"
+source "package/libsexy/Config.in"
+source "package/x11r7/xkeyboard-config/Config.in"
+
+comment "X Window managers"
+source "package/blackbox/Config.in"
+source "package/enlightenment/Config.in"
+source "package/fluxbox/Config.in"
+source "package/matchbox/Config.in"
+source "package/metacity/Config.in"
 endmenu
 
 menu "Hardware handling"
@@ -575,6 +575,26 @@ source "package/jsmin/Config.in"
 source "package/json-javascript/Config.in"
 endmenu
 
+menu "JSON/XML"
+source "package/cjson/Config.in"
+source "package/expat/Config.in"
+source "package/ezxml/Config.in"
+source "package/jansson/Config.in"
+source "package/json-c/Config.in"
+source "package/json-glib/Config.in"
+source "package/libjson/Config.in"
+source "package/libroxml/Config.in"
+source "package/libxml-parser-perl/Config.in"
+source "package/libxml2/Config.in"
+source "package/libxmlpp/Config.in"
+source "package/libxslt/Config.in"
+source "package/libyaml/Config.in"
+source "package/mxml/Config.in"
+source "package/rapidjson/Config.in"
+source "package/xerces/Config.in"
+source "package/yajl/Config.in"
+endmenu
+
 menu "Multimedia"
 source "package/libdvbsi/Config.in"
 source "package/libdvdnav/Config.in"
@@ -720,26 +740,6 @@ source "package/readline/Config.in"
 source "package/slang/Config.in"
 endmenu
 
-menu "JSON/XML"
-source "package/cjson/Config.in"
-source "package/expat/Config.in"
-source "package/ezxml/Config.in"
-source "package/jansson/Config.in"
-source "package/json-c/Config.in"
-source "package/json-glib/Config.in"
-source "package/libjson/Config.in"
-source "package/libroxml/Config.in"
-source "package/libxml-parser-perl/Config.in"
-source "package/libxml2/Config.in"
-source "package/libxmlpp/Config.in"
-source "package/libxslt/Config.in"
-source "package/libyaml/Config.in"
-source "package/mxml/Config.in"
-source "package/rapidjson/Config.in"
-source "package/xerces/Config.in"
-source "package/yajl/Config.in"
-endmenu
-
 endmenu
 
 menu "Miscellaneous"
