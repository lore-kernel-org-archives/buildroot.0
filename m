From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 16 Mar 2017 17:24:01 +0530
Subject: [Buildroot] [PATCH 3/3] taglib: update homepage link
In-Reply-To: <1489665241-14942-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489665241-14942-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1489665241-14942-3-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid redirect.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/taglib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 6521d48..a95f332 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TAGLIB
 	  and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and
 	  Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.
 
-	  http://taglib.github.com
+	  http://taglib.org/
 
 if BR2_PACKAGE_TAGLIB
 
-- 
2.6.2
