From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:33:04 -0000
Subject: [Buildroot] [git commit] libogg: document project URL and update
	description in menuconfig
Message-ID: <20120531113256.C6D0196E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d407a01c9a31f3245ab9d79535d0ea83e6307a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libogg/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libogg/Config.in b/package/libogg/Config.in
index effe74f..bf719ff 100644
--- a/package/libogg/Config.in
+++ b/package/libogg/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_LIBOGG
 	bool "libogg"
 	help
-	  Ogg is the name of Xiph.org's container format for audio,
-	  video, and metadata
+	  Ogg is a multimedia container format, and the native file
+	  and stream format for the Xiph.org multimedia codecs. As
+	  with all Xiph.org technology is it an open format free for
+	  anyone to use.
+
+	  http://xiph.org/ogg/
