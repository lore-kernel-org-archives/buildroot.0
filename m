From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 19:18:54 +0200
Subject: [Buildroot] [PATCH/next] package/mpd: bump version to 0.20.7
Message-ID: <20170527171854.28263-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 37141971e..cea79e264 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f4055e1189e5cc00e83706b2e0b5ead924ced0303e073d7802ee9f9a8eba4b47  mpd-0.20.6.tar.xz
+sha256  005ac663b39a76701ba043cce4caef82ac6b0c2f16aae12fdc28e1b3b5b6c780  mpd-0.20.7.tar.xz
 sha256  8305b8bc026f4b6bde28b8dd09bfdddbe5590acf36358eed4d083a396e301730  mpd-0.19.21.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 7fd9bc9f5..fce247299 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION_MAJOR = $(call qstrip,$(BR2_PACKAGE_MPD_VERSION_STRING))
 ifeq ($(BR2_PACKAGE_MPD_VERSION_0_20),y)
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 else
 MPD_VERSION = $(MPD_VERSION_MAJOR).21
 endif
-- 
2.11.0
