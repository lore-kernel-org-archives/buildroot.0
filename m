From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 23:46:10 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20141216225030.2E5657FD46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ce7d767bcbb0a96e8e0ef455df0b4a974b9a1cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7300443..81bb9e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,9 +303,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
+	source "package/dtv-scan-tables/Config.in"
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
-	source "package/dtv-scan-tables/Config.in"
 	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
 	source "package/evemu/Config.in"
@@ -424,7 +424,6 @@ menu "Lua libraries/modules"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-testmore/Config.in"
-	source "package/luasql-sqlite3/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
 	source "package/luaexpat/Config.in"
@@ -435,6 +434,7 @@ menu "Lua libraries/modules"
 	source "package/luaposix/Config.in"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
+	source "package/luasql-sqlite3/Config.in"
 	source "package/lunit/Config.in"
 	source "package/lzlib/Config.in"
 	source "package/orbit/Config.in"
@@ -460,8 +460,8 @@ menu "Perl libraries/modules"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
-	source "package/perl-xml-sax-base/Config.in"
 	source "package/perl-xml-sax/Config.in"
+	source "package/perl-xml-sax-base/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
@@ -837,9 +837,9 @@ menu "Networking"
 	source "package/libosip2/Config.in"
 	source "package/libpcap/Config.in"
 	source "package/librsync/Config.in"
-	source "package/libsocketcan/Config.in"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
+	source "package/libsocketcan/Config.in"
 	source "package/libsoup/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
@@ -1236,8 +1236,8 @@ endif
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/openvmtools/Config.in"
-	source "package/powerpc-utils/Config.in"
 	source "package/polkit/Config.in"
+	source "package/powerpc-utils/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
 	source "package/psmisc/Config.in"
