From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Mar 2017 16:58:16 +0100
Subject: [Buildroot] [git commit] taglib: update homepage link
Message-ID: <20170316155909.834E882489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a411212d22cb84b92201b5a02ef8b860b0a17280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid redirect.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
