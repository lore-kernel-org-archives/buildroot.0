From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 13:15:39 +0000
Subject: [Buildroot] [PATCH 1/1] package/libvorbis: add an upstream URL to
 Config.in
Message-ID: <20191128131539.7276-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
