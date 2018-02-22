From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Feb 2018 23:17:31 +0100
Subject: [Buildroot] [PATCH] website: update package number text
Message-ID: <20180222221731.7946-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have quite a bit more than "hundreds of packages" nowadays:

find package -name \*.mk | wc -l
2285

So adjust the text to say 'several thousand' instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/index.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index f0d0175bb7..300adbb83d 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -78,7 +78,7 @@
 	</div>
       </div>
 
-      <h4>Supports hundreds of packages</h4>
+      <h4>Supports several thousand packages</h4>
       <p>X.org stack, Gtk3, Qt 5, GStreamer, Webkit, Kodi, a large number of network-related and system-related utilities are supported.</p>
 
     </div><!--/col-lg-4 -->
-- 
2.11.0
