From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Sep 2016 00:46:39 -0300
Subject: [Buildroot] [PATCH] mpd-mpc: bump to version 0.28
Message-ID: <1473133599-9254-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The download has a .sig file so use it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
