From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:51:26 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.19.1
Message-ID: <20141028175205.78E58B1C7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8397e6c8aabe4c816fcc43b51ebededb1ff8ff85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash |    2 ++
 package/mpd/mpd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
new file mode 100644
index 0000000..7676b37
--- /dev/null
+++ b/package/mpd/mpd.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	8b3afcd440181c9bd18b229b5974e529d59648344dd371370d6f7d62ec2847c5	mpd-0.19.1.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ae37b14..b3ff6f5 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR)
+MPD_VERSION = $(MPD_VERSION_MAJOR).1
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
