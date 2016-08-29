From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 23:19:15 +0200
Subject: [Buildroot] [git commit] docs/website: remove reference to GMane
Message-ID: <20160829212115.77CD580466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d1cce411bf2af81a9ce020b6495e9beb1646921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GMane is dead (at least its web interface), so it's no longer really
useful to reference it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
