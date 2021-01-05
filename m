From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  5 Jan 2021 20:25:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xfont_font-alias: bump
 version to 1.0.4
Message-ID: <20210105192600.1339698-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hashes provided by upstream.

Release notes:
https://lists.x.org/archives/xorg-announce/2020-August/003054.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xfont_font-alias/xfont_font-alias.hash | 4 +++-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.hash b/package/x11r7/xfont_font-alias/xfont_font-alias.hash
index ae679a0ade..5390d1c126 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.hash
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2020-August/003054.html
+sha256  f3111ae8bf2e980f5f56af400e8eefe5fc9f4207f4a412ea79637fd66c945276  font-alias-1.0.4.tar.bz2
+sha512  c67ac2ee344a601fcc09471580214b30c3fd6acc4800702840de44f0733e6d18b3faeec2fa3f4e2314025cc1724d7d6796ebaf620398fe350710182fd2c4b07d  font-alias-1.0.4.tar.bz2
 # locally computed
-sha256  8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a  font-alias-1.0.3.tar.bz2
 sha256  bdba5452fc080c0f1a56d66978ac4150d1d1a00a9cc0248bba4f0b76c80ad47e  COPYING
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 8a37da44c0..7f8e4b2ea0 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_ALIAS_VERSION = 1.0.3
+XFONT_FONT_ALIAS_VERSION = 1.0.4
 XFONT_FONT_ALIAS_SOURCE = font-alias-$(XFONT_FONT_ALIAS_VERSION).tar.bz2
 XFONT_FONT_ALIAS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_ALIAS_LICENSE = MIT
-- 
2.29.2
