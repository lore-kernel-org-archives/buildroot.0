From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:12:50 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/x11r7/xfont_font-util: bump version to 1.3.2
Message-ID: <20190902161353.EE20186602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0cebcc8760bdbc04e0c8b8b8b570bc6f756f5ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Added all hashes provided by upstream and license hash.

Fixes a crash on 32bit archs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 09472e11dded79c7a033bdfa07b35ec67a645ac9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 8 +++++---
 package/x11r7/xfont_font-util/xfont_font-util.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index 7616ca3030..55beba89f3 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,6 +1,8 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002546.html
-sha1	0b16add3637c64b0bbaf1dd223b71b0421100c20				font-util-1.3.1.tar.bz2
-sha256	aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921	font-util-1.3.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-August/003019.html
+md5 3d6adb76fdd072db8c8fae41b40855e8  font-util-1.3.2.tar.bz2
+sha1 1b36275c174b64a9c16da5c902c91546789a67ef  font-util-1.3.2.tar.bz2
+sha256 3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282  font-util-1.3.2.tar.bz2
+sha512 7cac529b12ae71185b89c72c1569b9826f52eeaecc1c76010338e7c42c4078ae339f18220b580bbd68fb5dc09df6ecf169a47c32e6104d8ee53bd443fa21d167  font-util-1.3.2.tar.bz2
 
 # Locally calculated
 sha256	ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c	COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 89b138b647..cd2ae81cc3 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.3.1
+XFONT_FONT_UTIL_VERSION = 1.3.2
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
