From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:52:37 +0200
Subject: [Buildroot] [git commit] ncurses: drop unneeded trailing backslashes
Message-ID: <20170401165242.BBD35825CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=734363aeaa976955457925ca130ebd3787c8b820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9552364..68c77ac 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,8 +27,7 @@ NCURSES_CONF_OPTS = \
 	--enable-pc-files \
 	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
-	--without-manpages \
-
+	--without-manpages
 
 # Install after busybox for the full-blown versions
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -64,7 +63,7 @@ NCURSES_TERMINFO_FILES = \
 	v/vt220 \
 	x/xterm \
 	x/xterm-color \
-	x/xterm-xfree86 \
+	x/xterm-xfree86
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
