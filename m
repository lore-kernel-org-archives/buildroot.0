From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:54:57 +0100
Subject: [Buildroot] [git commit] website: update package number text
Message-ID: <20180225205502.C28BD88110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9c2ed71a0872e00c7e0043e74e28a37efc73cd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have quite a bit more than "hundreds of packages" nowadays:

find package -name \*.mk | wc -l
2285

So adjust the text to say 'several thousand' instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
