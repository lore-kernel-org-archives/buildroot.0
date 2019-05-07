From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:40 +0200
Subject: [Buildroot] [PATCH v1 20/28] package/python-mutagen: replace utf-8
 apostrophe by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-20-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	  supports ASF, FLAC, MP4, Monkey?s Audio, MP3, Musepack, Ogg
+	  supports ASF, FLAC, MP4, Monkey's Audio, MP3, Musepack, Ogg
 	  Opus, Ogg FLAC, Ogg Speex, Ogg Theora, Ogg Vorbis, True
 	  Audio, WavPack, OptimFROG, and AIFF audio files. All
 	  versions of ID3v2 are supported, and all standard ID3v2.4
--
2.21.0
