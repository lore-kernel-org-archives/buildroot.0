From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  5 Nov 2018 08:12:21 +0100
Subject: [Buildroot] [PATCH] package/mpd-mpc: bump to version 0.31
Message-ID: <20181105071221.7967-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd-mpc/mpd-mpc.hash | 2 +-
 package/mpd-mpc/mpd-mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.hash b/package/mpd-mpc/mpd-mpc.hash
index 05ec389e2c..b1f262fc08 100644
--- a/package/mpd-mpc/mpd-mpc.hash
+++ b/package/mpd-mpc/mpd-mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  65fc5b0a8430efe9acbe6e261127960682764b20ab994676371bdc797d867fce  mpc-0.30.tar.xz
+sha256  62373e83a8a165b2ed43967975efecd3feee530f4557d6b861dd08aa89d52b2d  mpc-0.31.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 0666339ff9..05c70ba04d 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_MPC_VERSION_MAJOR = 0
-MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).30
+MPD_MPC_VERSION = $(MPD_MPC_VERSION_MAJOR).31
 MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
-- 
2.19.1
