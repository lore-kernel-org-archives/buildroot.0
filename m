From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 16:19:28 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/ffmpeg: bump
 version to 4.2.2
Message-ID: <20200110151228.9B476885A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab6415682b3a054b3a983d788fefa5970ccd2fb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=9c992b5c3e3995a0e8f3316b3087205196dc6403;hb=refs/heads/release/4.2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 38510af3fb69f07ef15852607fc01b3709424081)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index a31811b903..1f68943fc7 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 cec7c87e9b60d174509e263ac4011b522385fd0775292e1670ecc1180c9bb6d4  ffmpeg-4.2.1.tar.xz
+sha256 cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c  ffmpeg-4.2.2.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 3dd2e3ef76..f0047c4e3b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.2.1
+FFMPEG_VERSION = 4.2.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
