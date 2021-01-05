From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  5 Jan 2021 20:26:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xfont_font-misc-ethiopic:
 bump version to 1.0.4
In-Reply-To: <20210105192600.1339698-1-bernd.kuhls@t-online.de>
References: <20210105192600.1339698-1-bernd.kuhls@t-online.de>
Message-ID: <20210105192600.1339698-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hashes provided by upstream.

Release notes:
https://lists.x.org/archives/xorg-announce/2020-August/003055.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash    | 4 +++-
 .../xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk      | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
index f806bf0898..45cf430018 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2020-August/003055.html
+sha256  698c0f6ddf9ca482250bdafa08293893148393bb9cb23e0a9ca313c6dbfc4ae0  font-misc-ethiopic-1.0.4.tar.bz2
+sha512  4fed9ff3782746898c56dac199e9ca89356f4967779937049b9ff4ffad202317c023859f92d44b371dfa5485d5368ccad648e64b12cde0ed21f7d4aee5affcd5  font-misc-ethiopic-1.0.4.tar.bz2
 # locally computed
-sha256  53cb1fd83afdbe7939c0eac34003676ee0e6023216892d98054db90b703c98a5  font-misc-ethiopic-1.0.3.tar.bz2
 sha256  94835f274f1ddad34f8fd3a06b2c493222a68e4094f4097000d101f22ee0d0d5  COPYING
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 6f345df52c..9ded4b6ced 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.3
+XFONT_FONT_MISC_ETHIOPIC_VERSION = 1.0.4
 XFONT_FONT_MISC_ETHIOPIC_SOURCE = font-misc-ethiopic-$(XFONT_FONT_MISC_ETHIOPIC_VERSION).tar.bz2
 XFONT_FONT_MISC_ETHIOPIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_MISC_ETHIOPIC_LICENSE = MIT
-- 
2.29.2
