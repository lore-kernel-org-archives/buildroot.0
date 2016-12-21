From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 21 Dec 2016 10:50:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/mimic: indentation cleanup
Message-ID: <1482313813-16016-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/mimic/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mimic/Config.in b/package/mimic/Config.in
index 757ac9e..79641d3 100644
--- a/package/mimic/Config.in
+++ b/package/mimic/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_MIMIC
 	bool "mimic"
 	depends on BR2_USE_WCHAR
 	help
-          Mimic is a fast, lightweight Text-to-speech engine developed
-          by Mycroft A.I. and VocaliD, based on Carnegie Mellon
-          University's Flite (Festival-Lite) software. Mimic takes in
-          text and reads it out loud to create a high quality voice.
+	  Mimic is a fast, lightweight Text-to-speech engine developed
+	  by Mycroft A.I. and VocaliD, based on Carnegie Mellon
+	  University's Flite (Festival-Lite) software. Mimic takes in
+	  text and reads it out loud to create a high quality voice.
 
-          https://github.com/MycroftAI/mimic
+	  https://github.com/MycroftAI/mimic
 
 if BR2_PACKAGE_MIMIC
 
-- 
1.9.1
