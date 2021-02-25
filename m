From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:11:22 +0100
Subject: [Buildroot] [git commit] package/screen: add SCREEN_CPE_ID_VENDOR
Message-ID: <20210225185016.D078C80012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=028aa3986d1fe07837c5442b46088be106e633ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:screen is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Ascreen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screen/screen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c1705f742d..c24067440e 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -8,6 +8,7 @@ SCREEN_VERSION = 4.8.0
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
+SCREEN_CPE_ID_VENDOR = gnu
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
