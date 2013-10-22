From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 10:34:10 +0200
Subject: [Buildroot] [git commit] mpd: bump to version 0.17.6
Message-ID: <20131022091810.7D9F99BA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00cb32b56a8194cc16a33f0183f7ee4ca6c81db7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 737be41..d8f344f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPD_VERSION = 0.17.5
+MPD_VERSION = 0.17.6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
