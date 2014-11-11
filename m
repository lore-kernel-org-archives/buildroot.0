From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 21:15:57 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.3
Message-ID: <20141111205928.C96C1B3FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=528c48626f8f08e42640010e5386c8201e911765
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 0861706..3e91179 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	73f0ed6b4001628287a71d077c624a2ca8200b24e3e877b725fcbf54dfe6a108	mpd-0.19.2.tar.xz
+sha256	fee3f3c59b5806767f23f7962621be7a62d4fcb852fff6b9ed6bbb5598a556d3	mpd-0.19.3.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 8ec3c0e..7061bdb 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).2
+MPD_VERSION = $(MPD_VERSION_MAJOR).3
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
