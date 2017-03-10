From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 10 Mar 2017 20:42:50 +0100
Subject: [Buildroot] [PATCH] mpd: bump to version 0.20.6
Message-ID: <20170310194250.31210-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index ecd78e97c..37141971e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  712b25351c12616630c580204e1c3dcba3ae2993a56cff1c346c87e334d69728  mpd-0.20.4.tar.xz
+sha256  f4055e1189e5cc00e83706b2e0b5ead924ced0303e073d7802ee9f9a8eba4b47  mpd-0.20.6.tar.xz
 sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 8e71ae214..79cc995c8 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION_MAJOR = $(call qstrip,$(BR2_PACKAGE_MPD_VERSION_STRING))
 ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
-MPD_VERSION = $(MPD_VERSION_MAJOR).4
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 else
 MPD_VERSION = $(MPD_VERSION_MAJOR).21
 endif
-- 
2.12.0
