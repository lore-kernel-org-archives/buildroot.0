From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 19:35:07 -0300
Subject: [Buildroot] [PATCH 2/2] mpd-mpc: bump to version 0.27
In-Reply-To: <1435271707-12012-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435271707-12012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1435271707-12012-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd-mpc/mpd-mpc.hash | 2 +-
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
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
-- 
2.3.6
