From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 12:06:25 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] ffmpeg: bump version to
 3.2.9
Message-ID: <20171127105904.7DB4E811AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22b996fef069fe18e50d7cca4a1b05a365087570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes a number of bugs, including integer/buffer overflows:

https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n3.2.9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index dcfc8aa..cf41f39 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 42e7362692318afc666f14378dd445effa9a1b09787504a6ab5811fe442674cd  ffmpeg-3.2.8.tar.xz
+sha256 1131d37890ed3dcbc3970452b200a56ceb36b73eaa51d1c23c770c90f928537f  ffmpeg-3.2.9.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9b287c7..f914f4e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.2.8
+FFMPEG_VERSION = 3.2.9
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
