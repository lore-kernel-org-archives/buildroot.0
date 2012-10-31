From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Oct 2012 14:23:34 -0300
Subject: [Buildroot] [PATCH 2/2] rtorrent: bump to version 0.9.3
In-Reply-To: <1351704214-11511-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351704214-11511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351704214-11511-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
