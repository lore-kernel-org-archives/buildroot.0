From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] mpd-mpc: bump to version 0.28
Message-ID: <20160906193115.B6C3C8222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5647bbf43c4cd875af96de8a080b76f8dca0b8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download has a .sig file so use it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd-mpc/mpd-mpc.hash | 4 ++--
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index b400386..8336893 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256	45a2be0a6dea65ed43f631294c24e74b83c8ee66d1ba6ab47d0744ddb1e62064	mpc-0.27.tar.xz
+# Locally calculated after checking pgp signature
+sha256	a4337d06c85dc81a638821d30fce8a137a58d13d510be34a11c1cce95cabc547	mpc-0.28.tar.xz
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index f5e9599..d9aa1f8 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).27
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).28
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPLv2+
