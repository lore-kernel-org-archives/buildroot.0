From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Feb 2021 19:11:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/xterm: add XTERM_CPE_ID_VENDOR
Message-ID: <20210221181131.3939059-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:invisible-island:xterm is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ainvisible-island%3Axterm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.0
