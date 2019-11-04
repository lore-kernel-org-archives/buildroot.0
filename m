From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:05:48 +0100
Subject: [Buildroot] [git commit] package/mpd-mpc: bump version to 0.33
Message-ID: <20191104210029.A51DA8164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d908329a2fa2922157ef29ad04dcc8ab26ec2c95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/MusicPlayerDaemon/mpc/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd-mpc/mpd-mpc.hash | 2 +-
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index f577802c34..9c55bcf03d 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  7961d95b7ce019996beab281cf957e905667c989c53fffd13ade5e62fea331c7  mpc-0.32.tar.xz
+sha256  4f40ccbe18f5095437283cfc525a97815e983cbfd3a29e48ff610fa4f1bf1296  mpc-0.33.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index d781b9a75e..6eebc63cca 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).32
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).33
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
