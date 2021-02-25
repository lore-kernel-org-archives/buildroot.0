From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:11:11 +0100
Subject: [Buildroot] [git commit] package/xterm: add XTERM_CPE_ID_VENDOR
Message-ID: <20210225185016.C78EB8648B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=879772f8e7ae14fc2bc68cf8b4a117e306d89ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:invisible-island:xterm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ainvisible-island%3Axterm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index f0c497e5e9..6f142a0b56 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,6 +10,7 @@ XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = COPYING
+XTERM_CPE_ID_VENDOR = invisible-island
 XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
