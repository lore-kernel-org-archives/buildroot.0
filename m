From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Oct 2012 23:15:07 +0100
Subject: [Buildroot] [git commit] rtorrent: bump to version 0.9.3
Message-ID: <20121031223835.4511C999B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ff05f80ffb82e077a332b0c0625f4696a138528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rtorrent/rtorrent.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index ff1ae2f..c9cf8ff 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-RTORRENT_VERSION = 0.9.2
+RTORRENT_VERSION = 0.9.3
 RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libsigc libtorrent ncurses
 RTORRENT_AUTORECONF = YES
+RTORRENT_LICENSE = GPLv2
+RTORRENT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
