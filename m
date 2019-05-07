From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 23:00:12 +0200
Subject: [Buildroot] [git commit] package/python-mutagen: replace utf-8
 apostrophe by ascii single quote
Message-ID: <20190507210158.4193A815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45cfcb53110b1193ede37fdf0b503507b0c604fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mutagen/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-mutagen/Config.in b/package/python-mutagen/Config.in
index 470cd996a7..3c95e37447 100644
--- a/package/python-mutagen/Config.in
+++ b/package/python-mutagen/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PYTHON_MUTAGEN
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Mutagen is a Python module to handle audio metadata.  It
-	  supports ASF, FLAC, MP4, Monkey???s Audio, MP3, Musepack, Ogg
+	  supports ASF, FLAC, MP4, Monkey's Audio, MP3, Musepack, Ogg
 	  Opus, Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True
 	  Audio, WavPack, OptimFROG, and AIFF audio files. All
 	  versions of ID3v2 are supported, and all standard ID3v2.4
