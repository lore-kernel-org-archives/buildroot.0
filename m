From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 22:27:42 +0200
Subject: [Buildroot] [PATCH] docs/website: remove reference to GMane
Message-ID: <1472502462-31246-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GMane is dead (at least its web interface), so it's no longer really
useful to reference it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/support.html | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 2f16efe..92ee03b 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -45,11 +45,6 @@
 		    Only subscribers to the Buildroot mailing list are allowed to post
 		    to this list.</p>
 
-		  <p>The list is also available
-		    through <a href="http://gmane.org">Gmane</a>
-		    at <a href="http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot">gmane.comp.lib.uclibc.buildroot</a>.
-		  </p>
-
 		  <h4>Search the List Archives</h4>
 		  <p>Please search the mailing list archives before asking questions on the mailing
 		    list, since there is a good chance someone else has asked the same question
-- 
2.7.4
