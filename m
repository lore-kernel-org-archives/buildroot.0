From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 20 Jun 2016 16:33:17 -0400
Subject: [Buildroot] [PATCH 1/1] website: rephrase several hundreds of
	packages
Message-ID: <1466454797-4645-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The phrase "Supports several hundreds of packages" is unusual to hear in
English (or at least American English). The more common alternatives are
"Supports several hundred packages" or "Supports hundreds of packages".
The latter sounds like a larger amount, so change the phrase to that.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 docs/website/index.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/index.html b/docs/website/index.html
index 61c2248..f0d0175 100644
--- a/docs/website/index.html
+++ b/docs/website/index.html
@@ -78,7 +78,7 @@
 	</div>
       </div>
 
-      <h4>Supports several hundreds of packages</h4>
+      <h4>Supports hundreds of packages</h4>
       <p>X.org stack, Gtk3, Qt 5, GStreamer, Webkit, Kodi, a large number of network-related and system-related utilities are supported.</p>
 
     </div><!--/col-lg-4 -->
-- 
2.5.0
