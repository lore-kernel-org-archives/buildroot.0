From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 21:24:19 +0100
Subject: [Buildroot] [git commit] package/kodi: Needs
	BR2_PACKAGE_FFMPEG_SWSCALE
Message-ID: <20150107202427.9EF37800E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1badd880f482ab676934556590c4c15d048a386
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8ab/8ab84a0e690b4e778aee5ac8ee7835da5737cfb4/
http://autobuild.buildroot.net/results/2b6/2b6a6ffb4ac464bcd41ad51c17d8a34f1967819f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 41f7798..7d89b5b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -38,6 +38,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC # postproc depends on GPL
+	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JASPER
