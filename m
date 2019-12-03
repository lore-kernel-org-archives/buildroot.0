From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:38:16 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libvorbis: add an
 upstream URL to Config.in
Message-ID: <20191203163035.0313686BFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53941315a91f5132b808b69b640bbb3622eec820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ab566a9acccc32658547c4028d1cd7447b7668b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvorbis/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libvorbis/Config.in b/package/libvorbis/Config.in
index 3d5b5d6d61..1b7cd6c3b2 100644
--- a/package/libvorbis/Config.in
+++ b/package/libvorbis/Config.in
@@ -13,3 +13,5 @@ config BR2_PACKAGE_LIBVORBIS
 	  representations such as MPEG-4 (AAC), and similar to, but
 	  higher performance than MPEG-1/2 audio layer 3, MPEG-4 audio
 	  (TwinVQ), WMA and PAC.
+
+	  https://xiph.org/vorbis/
