From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:07 +0200
Subject: [Buildroot] [PATCH 3/8] libogg: document project URL and update
	description in menuconfig
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
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
-- 
1.7.5.4
