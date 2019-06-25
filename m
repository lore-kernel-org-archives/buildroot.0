From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 22:51:39 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/ffmpeg: bump
 version to 3.4.6
Message-ID: <20190625205059.D5EA6884B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04c951e21ef58361b65803a465f0df45ff5048fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes a number of bugs discovered after the 3.4.5 release:
https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n3.4.6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index e00c4ec56c..e945130d88 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 741cbd6394eaed370774ca4cc089eaafbc54d0824b9aa360d4b3b0cbcbc4a92c  ffmpeg-3.4.5.tar.xz
+sha256 3572279cb139d9e39dcfbc23edf438ff5311ec3fc5d0dcb3558e49591e5cb83e  ffmpeg-3.4.6.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1e1004c378..d26555a506 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.4.5
+FFMPEG_VERSION = 3.4.6
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
