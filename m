From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2020 14:35:26 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/ffmpeg: bump version to 4.2.4
Message-ID: <20200824123527.7891-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfix release, fixing a number of issues since 4.2.3.  For details, see the
changelog:

https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/n4.2.4:/Changelog

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 35bd681326..752372619c 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31  ffmpeg-4.2.3.tar.xz
+sha256  0d5da81feba073ee78e0f18e0966bcaf91464ae75e18e9a0135186249e3d2a0b  ffmpeg-4.2.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 736aa5b4ba..ca90242f93 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.2.3
+FFMPEG_VERSION = 4.2.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.20.1
