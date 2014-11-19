From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 13:49:31 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.4
Message-ID: <20141201104836.8BCF17FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d30cc67c51efe44bc2b5b7ce750dca25c06b2cb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash |    2 +-
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 3e91179..f8bf014 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fee3f3c59b5806767f23f7962621be7a62d4fcb852fff6b9ed6bbb5598a556d3	mpd-0.19.3.tar.xz
+sha256	18f4af89e8b9a434da2b8678b53fc8189da97c1f32e9083512d67217166d3bd8	mpd-0.19.4.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7061bdb..1369847 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).4
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
