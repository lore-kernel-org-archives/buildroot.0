From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:19 -0000
Subject: [Buildroot] [git commit] ffmpeg: bump version to 2.5.4
Message-ID: <20150302222718.AD351807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b32eac742e426e2a8e3e2cb01a4b17491c2bdfef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 2.5.4
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.hash |    2 +-
 package/ffmpeg/ffmpeg.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index b1d8c95..c39174f 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9d383d7ef9dffe6980849a93accfef848e197fdac9b1fbd02fca2798f863411a	ffmpeg-2.5.3.tar.bz2
+sha256  cc91c166c2b0ad9aacc533e4d5637912df583b43834c68aeec12ded7e082a286  ffmpeg-2.5.4.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f9c1d94..68a28a2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.5.3
+FFMPEG_VERSION = 2.5.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
