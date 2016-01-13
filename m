From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 23:07:57 +0100
Subject: [Buildroot] [git commit] docs/website: fixing mixing content error
Message-ID: <20160113220831.32326827CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6b5f2c481cf617913ba99ff1e23283843f06c35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Firefox recently activated mixing content mode protection
(http elements in an https page). This patch changes
the external slides service to https.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/js/buildroot.js | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 2fd3b78..122436e 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -78,7 +78,7 @@ jQuery(document).ready(function($) {
     url = url.split(/[\\/]/).pop()
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
 
-    $('#slides').html('<iframe src="http://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
+    $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
 });
 
 function showTooltip(elem, msg) {
