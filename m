From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:40:22 +0200
Subject: [Buildroot] [git commit] mpd-mpc: bump to version 0.27
Message-ID: <20150626075003.479C38188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b26c657b5e04e21b22be321d4c99856139b1393
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd-mpc/mpd-mpc.hash |    2 +-
 package/mpd-mpc/mpd-mpc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index 4f348d5..b400386 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 20735f7173cce56bec50c1d8b4633751052dc68365b29a6113206dc1cdc6e242 mpc-0.26.tar.xz
+sha256	45a2be0a6dea65ed43f631294c24e74b83c8ee66d1ba6ab47d0744ddb1e62064	mpc-0.27.tar.xz
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 4e08c65..f5e9599 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).26
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).27
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPLv2+
