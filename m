From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:58:14 +0100
Subject: [Buildroot] [PATCH 1/3] website: Remove debug message
Message-ID: <1414972696-10647-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/js/buildroot.js | 1 -
 1 file changed, 1 deletion(-)

diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 03c3968..6e0d97a 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -28,7 +28,6 @@ function load_activity(feedurl, divid) {
         for (var i = 0; i < empty; i++) {
           container.appendChild(document.createElement("p"));
         }
-        console.log(loaded);
       }
     });
 }
-- 
2.1.1
